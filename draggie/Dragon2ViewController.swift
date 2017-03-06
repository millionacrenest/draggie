//
//  Dragon2ViewController.swift
//  draggie
//
//  Created by Allison Mcentire on 1/7/17.
//  Copyright © 2017 com.millionacrenest. All rights reserved.
//

import UIKit
import AVFoundation
import CoreData

class Dragon2ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var draggieImage: UIImageView!
    
    @IBOutlet var dragon2View: UIView!
    
    
    @IBOutlet weak var draggieNameLabel: UILabel!
   
    var currentDragonImageIndex:NSInteger = 0
 

    var player: AVAudioPlayer!
    
   
    
    var gravity: UIGravityBehavior!
    var animator: UIDynamicAnimator!
    var collision: UICollisionBehavior!
    
    
    let arrayOfDragons = [#imageLiteral(resourceName: "dragon1.png"),#imageLiteral(resourceName: "dragon3.png"),#imageLiteral(resourceName: "dragon4.png"),#imageLiteral(resourceName: "dragon2.png"),#imageLiteral(resourceName: "dragon5.png"),#imageLiteral(resourceName: "dragon6.png"),#imageLiteral(resourceName: "dragon7.png"),#imageLiteral(resourceName: "dragon8.png"),#imageLiteral(resourceName: "dragon9.png")]
    let backgroundImageArray = [#imageLiteral(resourceName: "artic.png"),#imageLiteral(resourceName: "beach.png"),#imageLiteral(resourceName: "mountain.jpg"),#imageLiteral(resourceName: "spring.png"),#imageLiteral(resourceName: "desert.png"),#imageLiteral(resourceName: "castle.png"),#imageLiteral(resourceName: "city.png"),#imageLiteral(resourceName: "moon.png"),#imageLiteral(resourceName: "volcano.png"),#imageLiteral(resourceName: "sea.png")]
    let particleArray = [#imageLiteral(resourceName: "Gold_Star.png")]
    
   // @IBOutlet weak var draggieNameLabel: UILabel!
    
   //  var controller: NSFetchedResultsController<Draggie>!
    
    // MARK: - Properties
    
   
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
       
        
        let fetchRequest:NSFetchRequest<Draggie> = Draggie.fetchRequest()
        
        do {
            
            let searchResults = try DatabaseController.getContext().fetch(fetchRequest)
            
            print("number of records: \(searchResults.count)")
            
            for result in searchResults as [Draggie] {
                draggieNameLabel.text = "\(result.draggieName!)"
               
//             let soundFileNSString = "\(result.roar!)"
//                print("the url is \(soundFileNSString)")
                
                
             
         
                
               
                
            }
        }
        catch {
            print("Error: \(error)")
        }
        
    
    
       
        
        let gestureRecognizerTapped = UITapGestureRecognizer(target: self, action: #selector(changeDragon))
        gestureRecognizerTapped.numberOfTapsRequired = 2
        dragon2View.addGestureRecognizer(gestureRecognizerTapped)
        
        
        
        
        
//        let gestureRecognizerSound = UITapGestureRecognizer(target: self, action: #selector(playSound))
//        gestureRecognizerSound.numberOfTapsRequired = 3
//        dragon2View.addGestureRecognizer(gestureRecognizerSound)
        
        
        let gestureRecognizerParticles = UITapGestureRecognizer(target: self, action: #selector(createParticles))
        gestureRecognizerParticles.numberOfTapsRequired = 4
        dragon2View.addGestureRecognizer(gestureRecognizerParticles)
        
//        let gestureRecognizerStopParticles = UITapGestureRecognizer(target: self, action: #selector(stopEmitterCell))
//        gestureRecognizerStopParticles.numberOfTapsRequired = 2
//        dragon2View.addGestureRecognizer(gestureRecognizerStopParticles)
        
        let gestureRecognizerBackground = UISwipeGestureRecognizer(target: self, action: #selector(changeBackground))
        dragon2View.addGestureRecognizer(gestureRecognizerBackground)
        
        let gestureRecognizerMusic = UIPinchGestureRecognizer(target: self, action: #selector(playSound))
        dragon2View.addGestureRecognizer(gestureRecognizerMusic)
        
        
        
        
        
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [draggieImage])
        animator.addBehavior(gravity)
        
        collision = UICollisionBehavior(items: [draggieImage])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        

        }
    
    
    
    
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)
    }

    
    

    func playSound() {
        
        
    
        
        
       
//        let fetchRequest:NSFetchRequest<Draggie> = Draggie.fetchRequest()
//        
//        do {
//            
//            let searchResults = try DatabaseController.getContext().fetch(fetchRequest)
//            
//            print("number of records: \(searchResults.count)")
//            
//            for result in searchResults as [Draggie] {
//               // draggieNameLabel.text = "\(result.draggieName!)"
//                
//               let soundFileNSString = "\(result.roar)"
//                let soundFileURL = soundFileNSString
//                
//                let urlFileString = NSURL(string: soundFileNSString)
//                print("the url = \(soundFileNSString)")
//                
//                
//                
//                
//                
//                
//            }
//        }
//        catch {
//            print("Error: \(error)")
//        }
        
      
       
        
     
        //var sound3 = Bundle.main.url(forResource:"sound", withExtension: "caf")
        var sound1 = Bundle.main.url(forResource: "chomp", withExtension: "m4a")
        var sound2 = Bundle.main.url(forResource: "chomp2", withExtension: "m4a")
        var sound3 = Bundle.main.url(forResource: "giggle", withExtension: "m4a")
        
        
        
        
        
        
      
        
        
     
        
        let soundArray = [sound1, sound2, sound3]
        
        let randNo = Int(arc4random_uniform(UInt32(soundArray.count)))
        
        
        let url = soundArray[randNo]
       // print("\(url)")
        
        
        do {
            /// this codes for making this app ready to takeover the device audio
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /// change fileTypeHint according to the type of your audio file (you can omit this)
            player = try AVAudioPlayer(contentsOf: url! as URL, fileTypeHint: AVFileTypeMPEGLayer3)
            
            // no need for prepareToPlay because prepareToPlay is happen automatically when calling play()
            player!.play()
        } catch let error as NSError {
            print("error: \(error.localizedDescription)")
        }
    }
    
    func playMusic() {
        
        var music1 = Bundle.main.url(forResource: "Schooldays", withExtension: "mp3")
        var music2 = Bundle.main.url(forResource: "Hopscotch", withExtension: "mp3")
        //    var sound3 = Bundle.main.url(forResource: "Schooldays", withExtension: "mp3")
        //        var sound4 = Bundle.main.url(forResource: "chomp4", withExtension: "m4a")
        //        var sound5 = Bundle.main.url(forResource: "chomp5", withExtension: "m4a")
        //        var sound6 = Bundle.main.url(forResource: "chomp6", withExtension: "m4a")
        //        var sound7 = Bundle.main.url(forResource: "chomp7", withExtension: "m4a")
        //        var sound8 = Bundle.main.url(forResource: "chomp8", withExtension: "m4a")
        
        let musicArray = [music1, music2]
        let randNo = Int(arc4random_uniform(UInt32(musicArray.count)))
        
        
        let url = musicArray[randNo]
        
        
        do {
            /// this codes for making this app ready to takeover the device audio
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /// change fileTypeHint according to the type of your audio file (you can omit this)
            player = try AVAudioPlayer(contentsOf: url!, fileTypeHint: AVFileTypeMPEGLayer3)
            
            // no need for prepareToPlay because prepareToPlay is happen automatically when calling play()
            player!.play()
        } catch let error as NSError {
            print("error: \(error.localizedDescription)")
        }
    }
    
  
    
    func changeDragon() {
        
        
        
        
        let randomIndex = Int(arc4random_uniform(UInt32(arrayOfDragons.count)))
        
        draggieImage.image = arrayOfDragons[randomIndex]
        
        
    }
    
    
    
    
    func changeBackground() {
        
        
        let randomBackground = Int(arc4random_uniform(UInt32(backgroundImageArray.count)))
        
        
        backgroundImage.image = backgroundImageArray[randomBackground]
        
        
        
        
        
    }

    func createParticles() {
        let particleEmitter = CAEmitterLayer()
        
        particleEmitter.emitterPosition = CGPoint(x: view.center.x, y: -96)
        particleEmitter.emitterShape = kCAEmitterLayerLine
        particleEmitter.emitterSize = CGSize(width: view.frame.size.width, height: 1)
        
        //let red = makeEmitterCell(color: UIColor.red)
        //let green = makeEmitterCell(color: UIColor.green)
        //let blue = makeEmitterCell(color: UIColor.blue)
        let yellow = makeEmitterCell(color: UIColor.yellow)
        let purple = makeEmitterCell(color: UIColor.purple)
        let white = makeEmitterCell(color: UIColor.white)
        //let orange = makeEmitterCell(color: UIColor.orange)
        let cyan = makeEmitterCell(color: UIColor.cyan)
        let magenta = makeEmitterCell(color: UIColor.magenta)
        
        
        particleEmitter.emitterCells = [yellow, purple, white, cyan, magenta]
        
        view.layer.addSublayer(particleEmitter)
      
        
        
    }
    
   
    
    
    
    func makeEmitterCell(color: UIColor) -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.birthRate = 1
        cell.lifetime = 3.0
        cell.lifetimeRange = 0
        cell.color = color.cgColor
        cell.velocity = 200
        cell.velocityRange = 50
        cell.emissionLongitude = CGFloat.pi
        cell.emissionRange = CGFloat.pi / 4
        cell.spin = 2
        cell.spinRange = 3
        cell.scaleRange = 0.5
        cell.scaleSpeed = -0.05
        
        
        let randomParticle = Int(arc4random_uniform(UInt32(particleArray.count)))
        
        
        
        cell.contents = (particleArray[randomParticle]).cgImage
        return cell
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        var music1 = Bundle.main.url(forResource: "Schooldays", withExtension: "mp3")
        var music2 = Bundle.main.url(forResource: "Hopscotch", withExtension: "mp3")
            var music3 = Bundle.main.url(forResource: "SimonSays", withExtension: "mp3")
                var music4 = Bundle.main.url(forResource: "MrJellyRolls", withExtension: "mp3")
                var music5 = Bundle.main.url(forResource: "AllFallDown", withExtension: "mp3")
                var music6 = Bundle.main.url(forResource: "RidingHigh", withExtension: "mp3")
                var music7 = Bundle.main.url(forResource: "8BitHeaven", withExtension: "mp3")
                var music8 = Bundle.main.url(forResource: "FirstSteps", withExtension: "mp3")
         var music9 = Bundle.main.url(forResource: "HideSeek", withExtension: "mp3")
        
        let musicArray = [music1, music2, music3, music4, music5, music6, music7, music8, music9]
        let randNo = Int(arc4random_uniform(UInt32(musicArray.count)))
        
        
        let url = musicArray[randNo]
        
        
        do {
            /// this codes for making this app ready to takeover the device audio
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /// change fileTypeHint according to the type of your audio file (you can omit this)
            player = try AVAudioPlayer(contentsOf: url!, fileTypeHint: AVFileTypeMPEGLayer3)
            
            // no need for prepareToPlay because prepareToPlay is happen automatically when calling play()
            player!.play()
        } catch let error as NSError {
            print("error: \(error.localizedDescription)")
        }
    }

    
    

    
//    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
//        
//        if event?.subtype == UIEventSubtype.motionShake{
//            
//            var music1 = Bundle.main.url(forResource: "Schooldays", withExtension: "mp3")
//            var music2 = Bundle.main.url(forResource: "Hopscotch", withExtension: "mp3")
//            //    var sound3 = Bundle.main.url(forResource: "Schooldays", withExtension: "mp3")
//            //        var sound4 = Bundle.main.url(forResource: "chomp4", withExtension: "m4a")
//            //        var sound5 = Bundle.main.url(forResource: "chomp5", withExtension: "m4a")
//            //        var sound6 = Bundle.main.url(forResource: "chomp6", withExtension: "m4a")
//            //        var sound7 = Bundle.main.url(forResource: "chomp7", withExtension: "m4a")
//            //        var sound8 = Bundle.main.url(forResource: "chomp8", withExtension: "m4a")
//            
//            let musicArray = [music1, music2]
//            let randNo = Int(arc4random_uniform(UInt32(musicArray.count)))
//            
//            
//            let url = musicArray[randNo]
//            
//            
//            do {
//                /// this codes for making this app ready to takeover the device audio
//                try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
//                try AVAudioSession.sharedInstance().setActive(true)
//                
//                /// change fileTypeHint according to the type of your audio file (you can omit this)
//                player = try AVAudioPlayer(contentsOf: url!, fileTypeHint: AVFileTypeMPEGLayer3)
//                
//                // no need for prepareToPlay because prepareToPlay is happen automatically when calling play()
//                player!.play()
//            } catch let error as NSError {
//                print("error: \(error.localizedDescription)")
//            }
//           
//        }
//    }
    
    
    
    
//    func documentsPathForFileName(name: String) -> String {
//        
//        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
//        return documentsPath.appending(name)
//    }
    
    
    
   
    
//    func gestureRecognizer(_: UIGestureRecognizer,
//                           shouldRecognizeSimultaneouslyWith shouldRecognizeSimultaneouslyWithGestureRecognizer:UIGestureRecognizer) -> Bool {
//        return true
//    }

    
    //  @IBAction func handlePinch2(recognizer : UIPinchGestureRecognizer) {
    //        if let view = recognizer.view {
    //            view.transform = view.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
    //            recognizer.scale = 1
    //        }
    //    }
    
   

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}

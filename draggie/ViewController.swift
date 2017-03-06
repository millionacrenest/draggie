//
//  ViewController.swift
//  draggie
//
//  Created by Allison Mcentire on 1/7/17.
//  Copyright © 2017 com.millionacrenest. All rights reserved.
//

import UIKit
import AVFoundation
import CoreData


class ViewController: UIViewController, UITextFieldDelegate {
    
   // AVAudioPlayerDelegate, AVAudioRecorderDelegate,
    
//    var audioPlayer: AVAudioPlayer?
    var audioRecorder: AVAudioRecorder?

    @IBOutlet weak var nameDraggieTextField: UITextField!
  
 
   
    @IBOutlet weak var draggieTitleLabel: UILabel!
    
   
    
  
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
     
        
        let fetchRequest:NSFetchRequest<Draggie> = Draggie.fetchRequest()
        
        do {
        
        let searchResults = try DatabaseController.getContext().fetch(fetchRequest)
        
            print("number of records: \(searchResults.count)")
            
            for result in searchResults as [Draggie] {
                print("\(result.draggieName!)")
                //print("\(result.roar!)")
                
            }
        }
        catch {
            print("Error: \(error)")
        }
    
    
        nameDraggieTextField.delegate = self
        
//        playButton.isEnabled = false
//        stopButton.isEnabled = false
//        
//        let fileMgr = FileManager.default
//        
//        let dirPaths = fileMgr.urls(for: .documentDirectory,
//                                    in: .userDomainMask)
//        
//        let soundFileURL = dirPaths[0].appendingPathComponent("sound.caf")
        
        let recordSettings =
            [AVEncoderAudioQualityKey: AVAudioQuality.min.rawValue,
             AVEncoderBitRateKey: 16,
             AVNumberOfChannelsKey: 2,
             AVSampleRateKey: 44100.0] as [String : Any]
//        
//        let audioSession = AVAudioSession.sharedInstance()
//        
//        do {
//            try audioSession.setCategory(
//                AVAudioSessionCategoryPlayAndRecord)
//        } catch let error as NSError {
//            print("audioSession error: \(error.localizedDescription)")
//        }
//        
//        do {
//            try audioRecorder = AVAudioRecorder(url: soundFileURL,
//                                                settings: recordSettings as [String : AnyObject])
//            audioRecorder?.prepareToRecord()
//        } catch let error as NSError {
//            print("audioSession error: \(error.localizedDescription)")
//        }
//        
   
       
        
       
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    @IBAction func recordAudio(_ sender: Any) {
//        if audioRecorder?.isRecording == false {
//            playButton.isEnabled = false
//            stopButton.isEnabled = true
//            audioRecorder?.record()
//        }
//        
//        
//    }
//    
//    @IBAction func stopAudio(_ sender: Any) {
//        stopButton.isEnabled = false
//        playButton.isEnabled = true
//        recordButton.isEnabled = true
//        
//        if audioRecorder?.isRecording == true {
//            audioRecorder?.stop()
//        } else {
//            audioPlayer?.stop()
//        }
//    }
//    
//    @IBAction func playAudio(_ sender: Any) {
//        if audioRecorder?.isRecording == false {
//            stopButton.isEnabled = true
//            recordButton.isEnabled = false
//            
//            do {
//                try audioPlayer = AVAudioPlayer(contentsOf:
//                    (audioRecorder?.url)!)
//                audioPlayer!.delegate = self
//                audioPlayer!.prepareToPlay()
//                audioPlayer!.play()
//            } catch let error as NSError {
//                print("audioPlayer error: \(error.localizedDescription)")
//            }
//        }
//        
//        
//        
//        
//    }
    
//    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
//        recordButton.isEnabled = true
//        stopButton.isEnabled = false
//    }
//    
//    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
//        print("Audio Play Decode Error")
//    }
//    
//    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
//    }
//    
//    func audioRecorderEncodeErrorDidOccur(_ recorder: AVAudioRecorder, error: Error?) {
//        print("Audio Record Encode Error")
//    }
//    
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.nameDraggieTextField.resignFirstResponder()
        return true
    }
    
    
    
    
    @IBAction func saveButton(_ sender: Any) {
        
//        let fileMgr = FileManager.default
//        
//        let dirPaths = fileMgr.urls(for: .documentDirectory,
//                                    in: .userDomainMask)
//        
//       let soundFileURL = dirPaths[0].appendingPathComponent("sound.caf")
//        
//        let soundFileString = "\(soundFileURL)"
//        print(soundFileString)
//        
//        
//      
//       
//        
//        
//        
//        
//        
//        let recordSettings =
//            [AVEncoderAudioQualityKey: AVAudioQuality.min.rawValue,
//             AVEncoderBitRateKey: 16,
//             AVNumberOfChannelsKey: 2,
//             AVSampleRateKey: 44100.0] as [String : Any]
//        
//        let audioSession = AVAudioSession.sharedInstance()
//        
//        do {
//            try audioSession.setCategory(
//                AVAudioSessionCategoryPlayAndRecord)
//        } catch let error as NSError {
//            print("audioSession error: \(error.localizedDescription)")
//        }
//        
//        do {
//            try audioRecorder = AVAudioRecorder(url: soundFileURL,
//                                                settings: recordSettings as [String : AnyObject])
//            audioRecorder?.prepareToRecord()
//        } catch let error as NSError {
//            print("audioSession error: \(error.localizedDescription)")
//        }
//        

        
        let draggie:Draggie = NSEntityDescription.insertNewObject(forEntityName: "Draggie", into: DatabaseController.getContext()) as! Draggie
        draggie.draggieName = nameDraggieTextField.text
        
        //draggie.roar = soundFileString
        
        
//        do {
//            let soundData = try Data(contentsOf: soundFileURL as URL)
//            draggie.roar = soundData as NSData?
//        } catch {
//            print("Unable to load data: \(error)")
//        }
        
        
       draggieTitleLabel.text = "Hi, I'm \(draggie.draggieName!)"
        
        
        
       
    
        
        
        
        DatabaseController.saveContext()
    }
    

    
    
}


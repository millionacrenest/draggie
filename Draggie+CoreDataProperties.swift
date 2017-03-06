//
//  Draggie+CoreDataProperties.swift
//  draggie
//
//  Created by Allison Mcentire on 1/27/17.
//  Copyright © 2017 com.millionacrenest. All rights reserved.
//

import Foundation
import CoreData


extension Draggie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Draggie> {
        return NSFetchRequest<Draggie>(entityName: "Draggie");
    }

    @NSManaged public var draggieName: String?
    @NSManaged public var roar: NSData?

}

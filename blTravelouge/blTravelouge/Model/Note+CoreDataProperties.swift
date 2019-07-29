//
//  Note+CoreDataProperties.swift
//  Noted
//
//  Created by Dale Musser on 10/16/18.
//  Copyright © 2018 Tech Innovator. All rights reserved.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var title: String?
    @NSManaged public var body: String?
    @NSManaged public var rawAddDate: NSDate?
    @NSManaged public var rawImage: NSData?

}

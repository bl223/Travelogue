//
//  Document+CoreDataProperties.swift
//  Travelouge
//
//  Created by Bryce Ligaya on 7/23/19.
//  Copyright © 2019 Bryce Ligaya. All rights reserved.
//
//

import Foundation
import CoreData


extension Document {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Document> {
        return NSFetchRequest<Document>(entityName: "Document")
    }

    @NSManaged public var name: String?
    @NSManaged public var content: String?
    @NSManaged public var size: Int64
    @NSManaged public var rawModifiedDate: NSDate?
    @NSManaged public var category: Category?
    
//
//    @NSManaged public var title: String?
//    @NSManaged public var body: String?
//    @NSManaged public var rawAddDate: NSDate?
//    @NSManaged public var rawImage: NSData?

}

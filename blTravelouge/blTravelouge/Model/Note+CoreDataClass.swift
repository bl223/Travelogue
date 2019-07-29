//
//  Note+CoreDataClass.swift
//  Noted
//
//  Created by Dale Musser on 10/16/18.
//  Copyright © 2018 Tech Innovator. All rights reserved.
//


import UIKit
import CoreData

@objc(Note)
public class Note: NSManagedObject {
    var addDate: Date? {
        get {
            return rawAddDate as Date?
        }
        set {
            rawAddDate = newValue as NSDate?
        }
    }
    
    var image: UIImage? {
        get {
            if let imageData = rawImage as Data? {
                return UIImage(data: imageData)
            } else {
                return nil
            }
        }
        set {
            if let image = newValue {
                rawImage = convertImageToNSData(image: image)
            }
        }
    }
    
    convenience init?(title: String, body: String?, image: UIImage?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        // import UIKit is needed to access UIApplication
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext, !title.isEmpty else {
            return nil
        }
        
        self.init(entity: Note.entity(), insertInto: managedContext)
        self.title = title
        self.body = body
        self.addDate = Date(timeIntervalSinceNow: 0)
        
        if let image = image {
            self.rawImage = convertImageToNSData(image: image)
        }
    }
    
//    func convertImageToNSData(image: UIImage) -> NSData? {
//        // The image data can be represented as PNG or JPEG data formats.
//        // Both ways to format the image data are listed below and the JPEG version is the one being used.
//
//        //return image.jpegData(compressionQuality: 1.0) as NSData?
//        return processImage(image: image).pngData() as NSData?
//    }
    
    func processImage(image: UIImage) -> UIImage {
        if (image.imageOrientation == .up) {
            return image
        }
        
        UIGraphicsBeginImageContext(image.size)
        
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size), blendMode: .copy, alpha: 1.0)
        let copy = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        guard let unwrappedCopy = copy else {
            return image
        }
        
        return unwrappedCopy
    }
}

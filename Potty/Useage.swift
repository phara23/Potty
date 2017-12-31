//
//  Useage.swift
//  Potty
//
//  Created by Mark on 12/29/17.
//  Copyright © 2017 Mark. All rights reserved.
//

import Foundation


class Useage: NSObject, NSCoding {
    var dateOf:String
    var time:String
    var strains:[String]
    var grams:Double
    var intakeMethods:[String]
    var userID:String
    var location:String
    
    init(inputDate: String, inputTime: String, inputStrains: [String], inputGrams: Double, inputIntakeMethods: [String], inputUserID: String, inputLocation: String) {
        dateOf = inputDate
        time = inputTime
        strains = inputStrains
        grams = inputGrams
        intakeMethods = inputIntakeMethods
        userID = inputUserID
        location = inputLocation
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let dateOf = aDecoder.decodeObject(forKey: PropertyKey.dateOf) as? String else {
            return nil
        }
        
        // Because photo is an optional property of Meal, just use conditional cast.
        let time = aDecoder.decodeObject(forKey: PropertyKey.time)
        
        let strains = aDecoder.decodeObject(forKey: PropertyKey.strains)
        
        let grams = aDecoder.decodeDouble(forKey: PropertyKey.grams)
        
        let intakeMethods = aDecoder.decodeObject(forKey: PropertyKey.intakeMethods)
        
        let userID = aDecoder.decodeObject(forKey: PropertyKey.userID)
        
        let location = aDecoder.decodeObject(forKey: PropertyKey.location)
        
        // Must call designated initializer.
        self.init(inputDate: dateOf, inputTime: time as! String, inputStrains: strains as! [String], inputGrams: grams as! Double, inputIntakeMethods: intakeMethods as! [String], inputUserID: userID as! String, inputLocation: location as! String!)
        
    }

    
    struct PropertyKey {
        static let dateOf = "dateOf"
        static let time = "time"
        static let strains = "strains"
        static let grams = "grams"
        static let intakeMethods = "intakeMethods"
        static let userID = "userID"
        static let location = "location"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(dateOf, forKey: PropertyKey.dateOf)
        aCoder.encode(time, forKey: PropertyKey.time)
        aCoder.encode(strains, forKey: PropertyKey.strains)
        aCoder.encode(grams, forKey: PropertyKey.grams)
        aCoder.encode(intakeMethods, forKey: PropertyKey.intakeMethods)
        aCoder.encode(userID, forKey: PropertyKey.userID)
        aCoder.encode(location, forKey: PropertyKey.location)
    }
}

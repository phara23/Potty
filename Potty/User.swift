//
//  User.swift
//  Potty
//
//  Created by Mark on 12/29/17.
//  Copyright © 2017 Mark. All rights reserved.
//

import Foundation
import os.log

class User: NSObject, NSCoding {
    var userID: String?
    var preferredSurveryTime: String?
    var useages: [Useage]?
    var surveys: [SurveyResult]?
    //var insights: [Insight]
    init(inputUserID: String, inputPreferredSurveyTime: String, inputUseages: [Useage], inputSurveys: [SurveyResult]) {
        userID = inputUserID
        preferredSurveryTime = inputPreferredSurveyTime
        useages = inputUseages
        surveys = inputSurveys
    }
    
    func addUseage(inputUseage: Useage) {
        self.useages!.append(inputUseage)
    }
    
    struct PropertyKey {
        static let userID = "userID"
        static let preferredSurveryTime = "preferredSurveryTime"
        static let useages = "useages"
        static let surveys = "surveys"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(userID, forKey: PropertyKey.userID)
        aCoder.encode(preferredSurveryTime, forKey: PropertyKey.preferredSurveryTime)
        aCoder.encode(useages, forKey: PropertyKey.useages)
        aCoder.encode(surveys, forKey: PropertyKey.surveys)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let userID = aDecoder.decodeObject(forKey: PropertyKey.userID) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        // Because photo is an optional property of Meal, just use conditional cast.
        let preferredSurveryTime = aDecoder.decodeObject(forKey: PropertyKey.preferredSurveryTime)
        
        let useages = aDecoder.decodeObject(forKey: PropertyKey.useages)
        
        let surveys = aDecoder.decodeObject(forKey: PropertyKey.surveys)
        
        // Must call designated initializer.
        self.init(inputUserID: userID, inputPreferredSurveyTime: preferredSurveryTime as! String, inputUseages: useages as! [Useage], inputSurveys: surveys as! [SurveyResult])
        
    }
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("users")

    
    
}

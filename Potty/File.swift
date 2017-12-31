//
//  File.swift
//  Potty
//
//  Created by Mark on 12/29/17.
//  Copyright © 2017 Mark. All rights reserved.
//

import Foundation

class SurveyResult {
    var datetime:String
    var userID: String
    var lastNightSleep: Int
    var anxietyLevel: Int
    var depressionLevel: Int
    var happinessLevel: Int
    var bigEvent: Bool
    var bigEventLevel: Int
    
    init(inputDatetime: String, inputUserID: String, inputLastNightSleep: Int, inputAnxietyLevel: Int, inputDepressionLevel: Int, inputHappinessLevel: Int, inputBigEvent: Bool, inputBigEventLevel: Int) {
        datetime = inputDatetime
        userID = inputUserID
        lastNightSleep = inputLastNightSleep
        anxietyLevel = inputAnxietyLevel
        depressionLevel = inputDepressionLevel
        happinessLevel = inputHappinessLevel
        bigEvent = inputBigEvent
        bigEventLevel = inputBigEventLevel
    }
}

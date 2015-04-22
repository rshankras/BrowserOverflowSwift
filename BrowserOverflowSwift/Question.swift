//
//  Question.swift
//  BrowserOverflowSwift
//
//  Created by Ravi Shankar on 22/04/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

import UIKit

class Question: NSObject {
    
    var date:NSDate = NSDate()
    var score:Int = 0
    var title:String = ""
    
    var answerSet: Set<Answer> = []
    
    
    func addAnswer(answer:Answer) {
        answerSet.insert(answer)
    }
    
    func answers() -> NSArray {
        let newSet:NSSet = answerSet
        let newArray:NSArray = newSet.allObjects
        var sortedResults: NSArray = newArray.sortedArrayUsingSelector("compare:")
        return sortedResults
    }
}

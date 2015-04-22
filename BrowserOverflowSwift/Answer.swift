//
//  Answer.swift
//  BrowserOverflowSwift
//
//  Created by Ravi Shankar on 22/04/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

import UIKit

class Answer: NSObject {
    
    var text:String = ""
    var person:Person = Person(name: "", avatarURL: NSURL(string: "")!)
    var accepted:Bool = false
    var score:Int = 0
    
    func compare(otherAnswer: Answer) -> NSComparisonResult {
        if accepted && !(otherAnswer.accepted) {
            return NSComparisonResult.OrderedAscending
        } else if (!accepted && otherAnswer.accepted) {
            return NSComparisonResult.OrderedDescending
        }
        
        if (score > otherAnswer.score) {
            return NSComparisonResult.OrderedAscending
        } else if (score < otherAnswer.score) {
            return NSComparisonResult.OrderedDescending
        } else {
            return NSComparisonResult.OrderedSame
        }
    }
}

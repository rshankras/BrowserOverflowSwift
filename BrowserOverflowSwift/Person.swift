//
//  Person.swift
//  BrowserOverflowSwift
//
//  Created by Ravi Shankar on 22/04/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

import UIKit

class Person: NSObject {
   
    var name:String = ""
    var avatarURL: NSURL = NSURL(string: "")!
    
    init(name:String,avatarURL: NSURL) {
        super.init()
        self.name = name
        self.avatarURL = avatarURL
    }
}

//
//  PersonTests.swift
//  BrowserOverflowSwift
//
//  Created by Ravi Shankar on 22/04/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

import UIKit
import XCTest

class PersonTests: XCTestCase {
    
    var person:Person?

    override func setUp() {
        super.setUp()
        let url = NSURL(string: "http://example.com/avatar.png")
        person = Person(name: "Ravi", avatarURL: url!)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testThatPersonHasRightName() {
        XCTAssertEqual(person!.name, "Ravi", "Expecting a person to provide its name")
    }
    
    func testThatPersonHasAvatarURL() {
        let url = person!.avatarURL
        XCTAssertEqual(url.absoluteString!, "http://example.com/avatar.png", "The Person avatar should be represented by a URL")
    }
    
}

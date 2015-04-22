//
//  AnswerTests.swift
//  BrowserOverflowSwift
//
//  Created by Ravi Shankar on 22/04/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

import UIKit
import XCTest

class AnswerTests: XCTestCase {

    let answer:Answer = Answer()
    let otherAnswer:Answer =  Answer()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let url = NSURL(string: "http://example.com/avatar.png")
        answer.person = Person(name: "Ravi", avatarURL: url!)
        answer.text = "The answer is 42"
        answer.score = 42
        
        otherAnswer.text = "I have the answer you need"
        otherAnswer.score = 42
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAnswerHasText() {
        XCTAssertEqual(answer.text, "The answer is 42", "Answers need to contain some text")
    }
    
    func testSomeOneProvidedTheAnswer() {
        XCTAssertTrue(answer.person.isKindOfClass(Person), "A Person gave this Answer")
    }
    
    func testAnsersNotAcceptedByDefault() {
        XCTAssertFalse(answer.accepted, "Answer not accepted by default")
    }
    
    func testAnswerCanBeAccepted() {
        answer.accepted = true
        XCTAssertTrue(answer.accepted, "It is possible to accept an answer")
    }
    
    func testAnswerHasScore() {
        XCTAssertEqual(answer.score, 42, "Answer score can be retrieved")
    }
    
    func testAcceptedAnswerComesBeforeUnAccepted() {
        otherAnswer.accepted = true
        otherAnswer.score = answer.score + 10
        
        XCTAssertEqual(answer.compare(otherAnswer), NSComparisonResult.OrderedDescending, "Acceped answer should come first")
        XCTAssertEqual(otherAnswer.compare(answer), NSComparisonResult.OrderedAscending, "UnAcceped answer should come last")
    }
    
    func testAnswersWithEqualScoreComparesEqually() {
        XCTAssertEqual(answer.compare(otherAnswer), NSComparisonResult.OrderedSame, "Both answers of equal rank.")
        XCTAssertEqual(otherAnswer.compare(answer), NSComparisonResult.OrderedSame, "Both answers of equal rank")
    }
    
    func testLowerScoringAnswerComesAfterHigher() {
        otherAnswer.score = answer.score + 10
        XCTAssertEqual(answer.compare(otherAnswer), NSComparisonResult.OrderedDescending, "Higher score comes first")
        XCTAssertEqual(otherAnswer.compare(answer), NSComparisonResult.OrderedAscending, "Lower score comes first")
    }
    
    
}

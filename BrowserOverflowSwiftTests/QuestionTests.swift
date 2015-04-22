//
//  QuestionTests.swift
//  BrowserOverflowSwift
//
//  Created by Ravi Shankar on 22/04/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

import UIKit
import XCTest

class QuestionTests: XCTestCase {
    
    let question = Question()
    let highScore = Answer()
    let lowScore = Answer()

    override func setUp() {
        super.setUp()

        question.date = NSDate.distantPast() as! NSDate
        question.score = 42
        question.title = "Do iPhones also dream of electic sheep?"
        
        let acceptedAnswer = Answer()
        acceptedAnswer.score = 1
        acceptedAnswer.accepted = true
        
        question.addAnswer(acceptedAnswer)
        
        lowScore.score = 3
        question.addAnswer(lowScore)
        
        highScore.score = 4
        question.addAnswer(highScore)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testQuesitonHasADate() {
        let pastDate:NSDate = NSDate.distantPast() as! NSDate
        question.date = pastDate
        XCTAssertEqual(question.date, pastDate, "Question need to provide its date")
    }
    
    func testQuestionKeepsScore() {
         XCTAssertEqual(question.score, 42, "Question need a numeric score")
    }
    
    func testQuestionHasTitle() {
          XCTAssertEqual(question.title, "Do iPhones also dream of electic sheep?", "Question should know its title")
    }
    
    func testQuestionCanHaveAnswerAdded() {
        XCTAssertEqual(question.answers().count, 3, "Must be able to add answers")
    }
    
    func testAcceptedAnswerFirst() {
        let acceptedAnswer: Answer = question.answers().objectAtIndex(0) as! Answer
        XCTAssertEqual(acceptedAnswer.accepted, true, "First answer should be accepted one")
    }
    
    func testHighScoreAnswerBeforeLow() {
        let answers = question.answers()
        let highIndex = answers.indexOfObject(highScore)
        let lowIndex = answers.indexOfObject(lowScore)
        XCTAssertTrue(highIndex < lowIndex, "High scoring answers come first")
    }
    
}

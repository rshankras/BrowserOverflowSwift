//
//  TopicTests.swift
//  BrowserOverflowSwift
//
//  Created by Ravi Shankar on 22/04/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

import UIKit
import XCTest

class TopicTests: XCTestCase {
    
    private var topic:Topic = Topic(name:"iPhone",tag:"iphone")
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testThatTopicExists() {
        XCTAssertNotNil(topic, "Should be able to create a topic instance")
    }
    
    func testThatTopicCanBeNamed() {
        XCTAssertEqual(topic.name, "iPhone", "the topic should have the name I gave it")
    }
    
    func testThatTopicHasTag() {
        XCTAssertEqual(topic.tag, "iphone", "topic needs to have tag")
    }
    
    func testForAListOfQuestions() {
        XCTAssertEqual(topic.recentQuestions(), [], "Topic should provide a list of recent questions")
    }
    
    func testForInitiallyEmptyQuestionList() {
        XCTAssertEqual(topic.recentQuestions().count, 0, "No questions added yet, count should be zero")
    }
    
    func testAddingAQuestionToTheList() {
        let question = Question()
        topic.addQuestion(question)
        XCTAssertEqual(topic.recentQuestions().count, 1, "Add a question, and the count of question should go up")
    }
    
    func testQuestionsAreListedChronologically() {
        let q1 = Question()
        q1.date = NSDate .distantPast() as! NSDate
        
        let q2 = Question()
        q2.date = NSDate .distantFuture() as! NSDate
        
        topic.addQuestion(q2)
        topic.addQuestion(q1)
        
        let questions = topic.recentQuestions()
        
        let firstQuestion = questions[0]
        let secondQuestion = questions[1]
        
        XCTAssertEqual(firstQuestion.date
            .laterDate(secondQuestion.date
            ), firstQuestion.date, "the later question should appear first in the list")
    }
    
    func testQuestionsAreListedChronologicallyReverseOrder() {
        let q1 = Question()
        q1.date = NSDate .distantPast() as! NSDate
        
        let q2 = Question()
        q2.date = NSDate .distantFuture() as! NSDate
        
        topic.addQuestion(q1)
        topic.addQuestion(q2)
        
        let questions = topic.recentQuestions()
        
        let firstQuestion = questions[0]
        let secondQuestion = questions[1]
        
        XCTAssertEqual(firstQuestion.date
            .laterDate(secondQuestion.date
            ), firstQuestion.date, "the later question should appear first in the list after changing the order")
    }
    
    func testLimiOfTwentyQuestions() {
        let question = Question()
        for index in 1...25 {
            topic.addQuestion(question)
        }
        
        XCTAssertTrue(topic.recentQuestions().count < 21, "There should never be more than 20 questions")
    }
    
}

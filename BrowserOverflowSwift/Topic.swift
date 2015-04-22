//
//  Topic.swift
//  BrowserOverflowSwift
//
//  Created by Ravi Shankar on 22/04/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

import UIKit

class Topic: NSObject {
    
    var name:String = ""
    var tag:String = ""
    
    private var questions:[Question] = []
    
    init(name:String, tag:String) {
        super.init()
        self.name = name
        self.tag = tag
        questions = []
    }
    
    func recentQuestions() -> [Question] {
        questions = sortQuestionsByDateDesc(questions)
        return questions
    }
    
    func addQuestion(question:Question) {
        questions.append(question)
        
        var newQuestions: [Question] = questions
        
        if newQuestions.count > 20  {
            newQuestions = sortQuestionsByDateDesc(newQuestions)
            newQuestions = Array(newQuestions[0...19])
        }
        questions = newQuestions
    }
    
    func sortQuestionsByDateDesc(questionList:[Question]) -> [Question] {
        var newQuestions = questionList
        newQuestions.sort({ $0.date.timeIntervalSinceNow > $1.date.timeIntervalSinceNow })
        return newQuestions
    }
}

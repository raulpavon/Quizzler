//
//  Question.swift
//  Quizzler
//
//  Created by Raúl Pavón on 01/02/22.
//

import Foundation

struct Question {
    let question: String
    let answer: String
    
    init(question: String, answer: String) {
        self.question = question
        self.answer = answer
    }
}

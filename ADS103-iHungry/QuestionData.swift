//
//  QuestionData.swift
//  ADS103-iHungry
//
//  Created by Chris Chong on 13/10/20.
//

import Foundation

struct Question {
    var text: String
    var answers: [Answer]
    
    mutating func shuffleAnswers() {
        answers.shuffle()
    }
}

struct Answer {
    var text: String
    var type: [ShopType]
}

enum ShopType: String {
    case shop1, shop2, shop3, shop4
}

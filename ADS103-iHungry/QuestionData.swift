//
//  QuestionData.swift
//  ADS103-iHungry
//
//  Created by wade chen on 13/10/20.
//

import Foundation

struct Question {
    var text: String
    var answers: [Answer]
}

struct Answer {
    var text: String
    var type: [ShopType]
}

enum ShopType: String {
    case shop1, shop2, shop3
}

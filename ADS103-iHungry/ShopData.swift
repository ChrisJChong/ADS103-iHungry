//
//  ShopData.swift
//  ADS103-iHungry
//
//  Created by Chris Chong on 13/10/20.
//

import Foundation
import UIKit

struct  ShopData{
    var type: ShopType = .shop1
    var mainImage: String = ""
    var name: String = ""
    var address: String = ""
    var phoneNumber: String = ""
    var starRating: String = ""
    var description: String = ""
    var recommendations: [String] = []
}

enum selection: Int {
    case cafe = 0,
    bar = 1,
    restaurant = 2
}




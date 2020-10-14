//
//  ShopData.swift
//  ADS103-iHungry
//
//  Created by wade chen on 13/10/20.
//

import Foundation
import UIKit

struct ShopData {
    var mainImage: UIImage
    var name: String
    var address: String
    var phoneNumber: String
    var starRating: String
    var description: String
    var recommendations: [UIImage]
}

enum selection: Int {
    case cafe = 0,
    bar = 1,
    restaurant = 2
}

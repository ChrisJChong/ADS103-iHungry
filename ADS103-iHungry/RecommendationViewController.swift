//
//  RecommendationViewController.swift
//  ADS103-iHungry
//
//  Created by Chris Chong on 12/10/20.
//

import UIKit

class RecommendationViewController: UIViewController {

    @IBOutlet weak var shopImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var recommendationImage1: UIImageView!
    @IBOutlet weak var recommendationImage2: UIImageView!
    @IBOutlet weak var recommendationImage3: UIImageView!
    
    var responses: [Answer]!
    var listOfShops: [ShopData]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        navigationItem.title = "RECOMMENDATION"
        calculateFrequency()
    }
    
    //Calculate Answer Frequency - 
    func calculateFrequency() {
        //Dictionary that holds the key - ShopType and the value - frequency
        var frequencyOfAnswers: [ShopType: Int] = [:]

        //Iterate through the reponses collection, and add or update the key/value pair in the dictionary
        for response in responses {
            
            for type in response.type {
                let newCount: Int
                
                if let oldCount = frequencyOfAnswers[type] {
                    newCount = oldCount + 1
                } else {
                    newCount = 1
                }
                frequencyOfAnswers[type] = newCount
            }
        }
        
        //Determine the most frequent answers
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        
        //Update the UI using the most frequent answer
        updateUI(using: mostCommonAnswer)
    }

    func updateUI(using type: ShopType) {

        var chosenShop: ShopData?

        //Find the shop that contains the chosen type
        for shop in listOfShops {
            if type == shop.type {
                chosenShop = shop
            }
        }

        //Note: images used in the following app are from https://unsplash.com/
        shopImage.image = UIImage(imageLiteralResourceName: chosenShop!.mainImage )
        titleLabel.text = chosenShop?.name
        addressLabel.text = chosenShop?.address
        phoneNumberLabel.text = chosenShop?.phoneNumber
        ratingLabel.text = chosenShop?.starRating
        descriptionLabel.text = chosenShop?.description
        recommendationImage1.image = UIImage(imageLiteralResourceName: chosenShop!.recommendations[0] )
        recommendationImage2.image = UIImage(imageLiteralResourceName: chosenShop!.recommendations[1] )
        recommendationImage3.image = UIImage(imageLiteralResourceName: chosenShop!.recommendations[2] )
    }

}

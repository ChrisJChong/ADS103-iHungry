//
//  ViewController.swift
//  ADS103-iHungry
//
//  Created by Chris Chong on 12/10/20.
//

import UIKit

class IntroductionViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var selectionButton1: UIButton!
    @IBOutlet weak var selectionButton2: UIButton!
    @IBOutlet weak var selectionButton3: UIButton!
    
    @IBOutlet weak var buttonImage1: UIImageView!
    @IBOutlet weak var buttonImage2: UIImageView!
    @IBOutlet weak var buttonImage3: UIImageView!
    
    //Stores the users selection
    var userSelected = 0
    
    //Stores cafe, restaraunt and bar data
    var shopArray = [[ShopData]]()
    
    //Shop data
    let cafeData: [ShopData] = [
        ShopData(type:.shop1 , mainImage: "cafe1", name: "Bernie's Cafe", address: "14 Porter Street, Richmond, Melbourne", phoneNumber: "9452 2234", starRating: "Rating: ⭐️⭐️⭐️", description: "A small cafe on the outskirts of Richmond, we serve quality food and drinks to satisfy your desires", recommendations: ["coffee4", "breakfast3", "lunch2"]),
        
        ShopData(type: .shop2, mainImage: "cafe2", name: "La Ritta", address: "543 Algae Road, Eastside Ridge, Melbourne", phoneNumber: "9423 0657", starRating: "Rating: ⭐️⭐️⭐️⭐️", description: "Friendly, Artistic and Satisfyingly calming environment where you can enjoy a relaxing meal or coffee", recommendations: ["lunch1", "coffee2", "breakfast1"]),
        
        ShopData(type: .shop3, mainImage: "cafe3", name: "Town Spring", address: "97 Downing Street, Fitzroy, Melbourne", phoneNumber: "9675 1324", starRating: "Rating: ⭐️⭐️⭐️⭐️⭐️", description: "Excellent coffee, Friendly staff and quiet neighbourhood, a great cafe to kick back and have a chat with a friend", recommendations: ["coffee1", "breakfast4", "lunch3"]),
        
        ShopData(type: .shop4, mainImage: "cafe4", name: "Early Bird", address: "21 Bullgor Court, Parkville, Melbourne", phoneNumber: "9034 7241", starRating: "Rating: ⭐️⭐️⭐️⭐️", description: "Tasty meals and delectable coffees, perfect for a catch up with a friend", recommendations: ["breakfast2", "coffee2", "coffee3"])
    ]
    
    let restarauntData: [ShopData] = [
        ShopData(type:.shop1 , mainImage: "restaurant1", name: "                         WoodReaver Hut", address: "54 Placa Road, Collingwood, Melbourne", phoneNumber: "9156 7634", starRating: "Rating: ⭐️⭐️⭐️", description: "A fresh, spacious and serene setting that can handle both indoor and outdoor seating. We serve exquisite foods and drinks to cater for our classy layout", recommendations: ["coffee4", "dinner2", "dessert4"]),
        
        ShopData(type: .shop2, mainImage: "restaurant2", name: "WhiteStone Haven", address: "38 Clue Road, Cremorne, Melbourne", phoneNumber: "9437 0153", starRating: "Rating: ⭐️⭐️⭐️⭐️", description: "We welcome customers to enjoy our classy and enticing environment, we serve buffet meals and offer the finest foods and drinks to our precious customers", recommendations: ["dinner1", "softdrink2", "lunch4"]),
        
        ShopData(type: .shop3, mainImage: "restaurant3", name: "Rocky Road Diners", address: "20 Queensbury Street, Docklands, Melbourne", phoneNumber: "9346 2364", starRating: "Rating: ⭐️⭐️⭐️⭐️⭐️", description: "Check out our old school retro style environment. It will take you back to the past where you can feast upon nostalgic meals and goodies", recommendations: ["coffee1", "dinner4",  "dessert2"]),
        
        ShopData(type: .shop4, mainImage: "restaurant4", name: "Red Bamboo", address: "7 Kin Court, South Melbourne, Melbourne", phoneNumber: "9012 2122", starRating: "Rating: ⭐️⭐️⭐️⭐️", description: "Authentic, traditional asian cuisine benefitting for customers who want to experience a unique and stylish meal", recommendations: ["dinner3", "softdrink3", "lunch1"])
    ]
    
    let barData: [ShopData] = [
        ShopData(type:.shop1 , mainImage: "bar1", name: "Bar by the Bay", address: "92 Hill Street, Port Melbourne, Melbourne", phoneNumber: "9037 6565", starRating: "Rating: ⭐️⭐️⭐️⭐️⭐️", description: "A great place to chill and try out our finest alcohol beverages brewed by our famous brewery", recommendations: ["alcohol2", "softdrink3", "coffee3"]),
        
        ShopData(type: .shop2, mainImage: "bar2", name: "Night Bar Alley", address: "11 West Road, Newport, Melbourne", phoneNumber: "9325 8356", starRating: "Rating: ⭐️⭐️⭐️⭐️", description: "Old, unique and magical. Words that can only describe the atmosphere of a small bar and its wide range of alcohol from all over the world", recommendations: ["alcohol4",  "dessert1", "softdrink1"]),
        
        ShopData(type: .shop3, mainImage: "bar3", name: "Secrets", address: "5 Dockland Street, South Wharf, Melbourne", phoneNumber: "9121 4653", starRating: "Rating: ⭐️⭐️⭐️", description: "Small, lively and upbeat bar where chilling with your friends is our priority, we have special offers on our wide range of alcohols", recommendations: ["coffee1", "softdrink2", "alcohol1"]),
        
        ShopData(type: .shop4, mainImage: "bar4", name: "Ole Tavern", address: "9a Seddon Pde, South Yarra, Melbourne", phoneNumber: "9890 8457", starRating: "Rating: ⭐️⭐️⭐️⭐️", description: "One of the few bars around Melbourne that hosts live performances for musicians. It will be a night to remember with our homemade brews", recommendations: ["alcohol3", "coffee2", "dessert3"])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        shopArray.append(cafeData)
        shopArray.append(restarauntData)
        shopArray.append(barData)
    }

    //UI set up
    func setup() {
        //Set up imageView
        logoImageView.image = UIImage(imageLiteralResourceName: "logo")
        
        //Set up button 1
        selectionButton1.setTitle("Find a cafe", for: .normal)
        buttonImage1.image = UIImage(imageLiteralResourceName: "button")
        
        //Set up button 2
        selectionButton2.setTitle("Find a restaurant", for: .normal)
        buttonImage2.image = UIImage(imageLiteralResourceName: "button")
        
        //Set up button 3
        selectionButton3.setTitle("Find a bar", for: .normal)
        buttonImage3.image = UIImage(imageLiteralResourceName: "button")
    }
    
    @IBAction func userSelectionPressed(_ sender: UIButton) {
        userSelected = sender.tag
        performSegue(withIdentifier: "SelectionIdentifier", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigation = segue.destination as! UINavigationController
        
        // Pass the selected shop data to the new view controller.
        let questionViewController = navigation.topViewController as! QuestionViewController
            questionViewController.listOfShops = shopArray[userSelected]
    }

    @IBAction func unwindToQuizIntroduction(segue: UIStoryboardSegue) {
    }
}


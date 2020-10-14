//
//  ViewController.swift
//  ADS103-iHungry
//
//  Created by wade chen on 12/10/20.
//

import UIKit

class IntroductionViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var selectionButton1: UIButton!
    @IBOutlet weak var selectionButton2: UIButton!
    @IBOutlet weak var selectionButton3: UIButton!
    
    var userSelected = 0
    
    //Shop data
    var cafeData: [ShopData] = [
        ShopData(mainImage: UIImage(named: "cafe1")!, name: "", address: "", phoneNumber: "", starRating: "⭐️⭐️⭐️", description: "", recommendations: [UIImage(imageLiteralResourceName: "coffee1"), UIImage(imageLiteralResourceName: "coffee2"), UIImage(imageLiteralResourceName: "coffee3")]),
        
        ShopData(mainImage: UIImage(named: "cafe2")!, name: "", address: "", phoneNumber: "", starRating: "⭐️⭐️⭐️⭐️", description: "", recommendations: [UIImage(imageLiteralResourceName: "coffee1"), UIImage(imageLiteralResourceName: "coffee2"), UIImage(imageLiteralResourceName: "coffee3")]),
        
        ShopData(mainImage: UIImage(named: "cafe3")!, name: "", address: "", phoneNumber: "", starRating: "⭐️⭐️⭐️⭐️⭐️", description: "", recommendations: [UIImage(imageLiteralResourceName: "coffee1"), UIImage(imageLiteralResourceName: "coffee2"), UIImage(imageLiteralResourceName: "coffee3")])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }

    //UI set up
    func setup() {
        //Set up imageView
        logoImageView.image = UIImage(imageLiteralResourceName: "appIcon")
        
        //Set up button 1
        selectionButton1.setTitle("Find a cafe", for: .normal)
        
        //Set up button 2
        selectionButton2.setTitle("Find a restaurant", for: .normal)
        
        //Set up button 3
        selectionButton3.setTitle("Find a bar", for: .normal)
    }
    
    @IBAction func userSelectionPressed(_ sender: UIButton) {
        userSelected = sender.tag
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        
        // Pass the shop data to the new view controller.
        if segue.identifier == "SelectionIdentifier" {
            let questionViewController = segue.destination as! QuestionViewController
            questionViewController.shop = cafeData
            //Later set this code up to choose between cafe, restaurant and bar
        }
        
    }

}


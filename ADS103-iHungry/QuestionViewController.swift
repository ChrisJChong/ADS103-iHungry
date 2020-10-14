//
//  QuestionViewController.swift
//  ADS103-iHungry
//
//  Created by wade chen on 12/10/20.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    
    @IBOutlet weak var questionNumber: UILabel!
    
    var shop = [ShopData]()
    
    var answersChosen: [Answer] = []
    
    var questionIndex = 0
    
    var questions: [Question] = [
        Question(text: "What is your budget?",
                 answers: [
                    Answer(text: "< $15", type: [.shop1, .shop2, .shop3]),
                    Answer(text: "$15 - $30", type: [.shop1, .shop2, .shop3]),
                    Answer(text: "$30 - $50", type: [.shop1, .shop2, .shop3]),
                    Answer(text: "$50 >", type: [.shop1, .shop2, .shop3])
                 ]),
        Question(text: "Choose your preferred meal time: ",
                 answers: [
                    Answer(text: "Breakfast (8am - 10am)", type: [.shop1, .shop2, .shop3]),
                    Answer(text: "Brunch (10am - 12pm)", type: [.shop1, .shop2, .shop3]),
                    Answer(text: "Lunch (12pm - 3pm)", type: [.shop1, .shop2, .shop3]),
                    Answer(text: "Dinner (5pm - 9pm)", type: [.shop1, .shop2, .shop3])
                 ]),
        Question(text: "What do you feel like having?",
                 answers: [
                    Answer(text: "Coffee", type: [.shop1, .shop2, .shop3]),
                    Answer(text: "Food", type: [.shop1, .shop2, .shop3]),
                    Answer(text: "Alcohol", type: [.shop1, .shop2, .shop3]),
                    Answer(text: "Dessert", type: [.shop1, .shop2, .shop3])
                 ]),
        Question(text: "Which of the following would you like to go to?",
                 answers: [
                    Answer(text: "Cinema", type: [.shop1, .shop2, .shop3]),
                    Answer(text: "Swimming Pool", type: [.shop1, .shop2, .shop3]),
                    Answer(text: "Shopping Mall", type: [.shop1, .shop2, .shop3]),
                    Answer(text: "Bowling Alley", type: [.shop1, .shop2, .shop3])
                 ])
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationItem.hidesBackButton = false
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        
        let currentQuestion = questions[questionIndex]
        
        navigationItem.title = "Question #\(questionIndex+1)"
        questionLabel.text = currentQuestion.text
        questionNumber.text = "\(questionIndex+1) of 4"
        
        updateButtonText(using: currentQuestion.answers)
    }
    
    func updateButtonText(using answers: [Answer]) {
        answerButton1.setTitle(answers[0].text, for: .normal)
        answerButton2.setTitle(answers[1].text, for: .normal)
        answerButton3.setTitle(answers[2].text, for: .normal)
        answerButton4.setTitle(answers[3].text, for: .normal)
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let currentAnwsers = questions[questionIndex].answers
        
        switch sender {
        case answerButton1:
            answersChosen.append(currentAnwsers[0])
        case answerButton2:
            answersChosen.append(currentAnwsers[1])
        case answerButton3:
            answersChosen.append(currentAnwsers[2])
        case answerButton4:
            answersChosen.append(currentAnwsers[3])
        default:
            break
        }
        nextQuestion()
    }

    func nextQuestion() {
        questionIndex += 1
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "RecommendationIdentifier", sender: nil)
        }
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "RecommendationIdentifier" {
            
        }
    }
    

}

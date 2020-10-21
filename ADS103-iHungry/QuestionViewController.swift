//
//  QuestionViewController.swift
//  ADS103-iHungry
//
//  Created by Chris Chong on 12/10/20.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    @IBOutlet weak var buttonImage1: UIImageView!
    @IBOutlet weak var buttonImage2: UIImageView!
    @IBOutlet weak var buttonImage3: UIImageView!
    @IBOutlet weak var buttonImage4: UIImageView!
    
    @IBOutlet weak var questionNumber: UILabel!
    
    var listOfShops = [ShopData]()
    
    var answersChosen: [Answer] = []
    
    var questionIndex = 0
    
    var questions: [Question] = [
        Question(text: "What is your budget?",
                 answers: [
                    Answer(text: "< $15", type: [.shop1, .shop2, .shop3,.shop4]),
                    Answer(text: "$15 - $30", type: [.shop2, .shop3]),
                    Answer(text: "$30 - $50", type: [.shop1, .shop3, .shop4]),
                    Answer(text: "$50 >", type: [.shop4, .shop2])
                 ]),
        Question(text: "What genre of music do you prefer? ",
                 answers: [
                    Answer(text: "Jazz", type: [.shop4, .shop2, .shop3]),
                    Answer(text: "Hip hop", type: [.shop1, .shop4, .shop3]),
                    Answer(text: "Classical", type: [.shop1, .shop2]),
                    Answer(text: "Pop", type: [.shop1, .shop2, .shop3,.shop4])
                 ]),
        Question(text: "What do you feel like having?",
                 answers: [
                    Answer(text: "Coffee", type: [.shop1, .shop2, .shop3]),
                    Answer(text: "Food", type: [.shop1, .shop2, .shop3]),
                    Answer(text: "Alcohol", type: [.shop4, .shop2, .shop3]),
                    Answer(text: "Dessert", type: [.shop1, .shop2, .shop4])
                 ]),
        Question(text: "Where would you like to go after?",
                 answers: [
                    Answer(text: "Cinema", type: [.shop2]),
                    Answer(text: "Swimming Pool", type: [.shop2, .shop3]),
                    Answer(text: "Shopping Mall", type: [.shop1, .shop2, .shop3,.shop4]),
                    Answer(text: "Bowling Alley", type: [.shop1, .shop4])
                 ])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonImage1.image = UIImage(imageLiteralResourceName: "button")
        buttonImage2.image = UIImage(imageLiteralResourceName: "button")
        buttonImage3.image = UIImage(imageLiteralResourceName: "button")
        buttonImage4.image = UIImage(imageLiteralResourceName: "button")
        
        shuffleAnswersAndQuestions()
        updateUI()
    }
    
    func updateUI() {
        let currentQuestion = questions[questionIndex]
        
        navigationItem.title = "QUESTION #\(questionIndex+1)"
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
    
    func shuffleAnswersAndQuestions() {
        //Randomises answers for each question in the array
        questions[0].shuffleAnswers()
        questions[1].shuffleAnswers()
        questions[2].shuffleAnswers()
        questions[3].shuffleAnswers()

        //Randomises each questions in the array
        questions.shuffle()
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RecommendationIdentifier" {
            let recommendationViewController = segue.destination as! RecommendationViewController
            recommendationViewController.responses = answersChosen
            recommendationViewController.listOfShops = listOfShops
        }
    }
}

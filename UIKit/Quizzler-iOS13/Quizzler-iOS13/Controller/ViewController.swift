//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    var progressNumber: Float = 0
    var quizNumber = 0
    
    @IBAction func answerButton(_ sender: UIButton) {
        if quizBrain.checkAnswer(sender.currentTitle!){
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        
        if quizNumber < quizBrain.quiz.count-1{
            quizNumber += 1
            progressNumber += 1
            updateUI()
        }else{
            quizNumber = 0
            progressNumber = 0
            updateUI()
        }
        quizBrain.nextQuestion()
    }
    
    func updateUI(){
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false){_ in
            self.questionText.text = self.quizBrain.quiz[self.quizNumber].questions
            self.trueButton.backgroundColor = UIColor.clear
            self.falseButton.backgroundColor = UIColor.clear
            self.progressBar.progress = self.progressNumber/Float(self.quizBrain.quiz.count)
            self.scoreLabel.text = "Score: \(self.quizBrain.checkScore())"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        progressBar.progress = 0
    }
}

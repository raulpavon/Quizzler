//
//  ViewController.swift
//  Quizzler
//
//  Created by Raúl Pavón on 01/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizManager = QuizManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.titleLabel?.text ?? ""
        
        if quizManager.checkAnswer(userAnswer) {
            sender.backgroundColor = .green
            sender.layer.cornerRadius = 25
        } else {
            sender.backgroundColor = .red
            sender.layer.cornerRadius = 25
        }
        
        quizManager.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizManager.getQuestion()
        progressBar.progress = quizManager.getProgress()
        scoreLabel.text = "Score: \(quizManager.getScore())"
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
    }
}


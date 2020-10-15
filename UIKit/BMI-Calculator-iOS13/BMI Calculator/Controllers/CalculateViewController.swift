//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSliderValue: UISlider!
    @IBOutlet weak var weightSliderValue: UISlider!
    
    @IBAction func heightSliderChange(_ sender: UISlider) {
        if sender.tag == 1 {
            heightLabel.text = "\(String(format:"%.2f",sender.value))m"
        } else {
            weightLabel.text = "\(String(format:"%.2f",sender.value))kg"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSliderValue.value
        let weight = weightSliderValue.value
        calculatorBrain.calculateBMI(height:height,weight:weight)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    //This function prepares data to pass to the next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}

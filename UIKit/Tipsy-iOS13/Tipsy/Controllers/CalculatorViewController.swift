//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var stepValue = 0
    var tipValue = 0.0, resultBill = 0.0

    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        if sender.currentTitle == "0%"{
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tipValue = 0.0
        } else if sender.currentTitle == "10%"{
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            tipValue = 0.1
        } else{
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            tipValue = 0.2
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        stepValue = Int(sender.value)
        splitNumberLabel.text = String(stepValue)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let totalBill = Double(billTextField.text ?? "1")! * (1 + tipValue)

        if let safeOptional = splitNumberLabel.text {
            resultBill = totalBill / Double(safeOptional)!
            print(totalBill / Double(safeOptional)!)
        }
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destination = segue.destination as! ResultsViewController
            destination.finalBill = resultBill
            destination.finalTip = Int(tipValue * 100)
            destination.numberOfPeople = splitNumberLabel.text ?? "0"
        }
    }
}


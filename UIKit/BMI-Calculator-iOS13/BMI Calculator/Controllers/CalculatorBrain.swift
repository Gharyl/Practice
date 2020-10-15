//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Gary Chen on 10/7/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain{
    
    var BMIValue: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmi = weight / (height * height)
        if bmi < 18.5 {
            BMIValue = BMI(value: bmi, advice: "Eat more pies!", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        } else if bmi < 24.9 {
            BMIValue = BMI(value: bmi, advice: "Fit as a fiddle!", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        } else {
            BMIValue = BMI(value: bmi, advice: "Eat less pies!", color: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
        }
    }
    
    func getBMIValue() -> String{
        if let safeOptional = BMIValue?.value{
            return String(format: "%0.1f", safeOptional)
        } else {
            return "0.0"
        }
        
        /*
         
         Another way to do this is:
            return String(format: "%0.1f", BMIValue ?? "0.0")
         
         */
    }
    
    func getColor() -> UIColor {
        return BMIValue?.color ?? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    func getAdvice() -> String {
        return BMIValue?.advice ?? "NO ADVICE"
    }
}

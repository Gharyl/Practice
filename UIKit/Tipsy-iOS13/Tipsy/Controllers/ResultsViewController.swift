//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Gary Chen on 10/8/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var finalBill = 0.0
    var finalTip = 0
    var numberOfPeople = "0"

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = "$" + String(format: "%0.2f", finalBill)
        settingsLabel.text = "Split between \(numberOfPeople) people, with \(finalTip)% tip."
    }
}

//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

//UIPickerViewDataSource provides data to any UIPickerView

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //need the keyword "static" to use method without instance
        return CoinManager.currencyArray.count
    }
    
    //UIPickerView calls this function to set the name/title of each row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return CoinManager.currencyArray[row]
    }
    
    //UIPickerView calls this function to record the row user selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        CoinManager.getCoinPrice(for: CoinManager.currencyArray[row])
    }

    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting the viewcontroller as the source
        currencyPicker.dataSource = self
        //in order to update pickerView IBOutlet, need to declare a delegate
        currencyPicker.delegate = self
    }


}


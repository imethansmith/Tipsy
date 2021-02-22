//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    var amountToSplit: Float?
    var splitByPeople: Double = 2.0
    var currentButton: UIButton?
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        currentButton?.isSelected = false
        currentButton = sender
        currentButton?.isSelected = true
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitByPeople = sender.value
        splitNumberLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        func currentPct () -> Double {
            switch currentButton?.currentTitle {
            case "0%":
                return 1.0
            case "10%":
                return 1.1
            default:
                return 1.2
            }
        }
        let getCurrentPct = currentPct()
        print(String(format: "%.2f", (Double(billTextField.text!)! * getCurrentPct) / splitByPeople))
    }
    
}


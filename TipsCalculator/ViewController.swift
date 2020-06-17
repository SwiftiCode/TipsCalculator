//
//  ViewController.swift
//  TipsCalculator
//
//  Created by Thomas.Tay.sg on 23/2/16.
//  Copyright © 2016 Thomas.Tay.sg. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    @IBOutlet weak var tipTextField: UITextField!
    @IBOutlet weak var tipSegmentControl: UISegmentedControl!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    
    var inputBill: Double = 0.0
    
    // MARK: Default Template
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipTextField.delegate = self
        
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        inputBill = Double(textField.text!) ?? 0
        reCalculateTips(tipSegmentControl)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
        
    }
    
    // MARK: IBAction
    
    @IBAction func reCalculateTips(_ sender: UISegmentedControl) {
        
        var tipRate: Double
        
        tipTextField.resignFirstResponder()
        
        let rateIndex = tipSegmentControl.selectedSegmentIndex
        
        
        switch rateIndex {
            
        case 0: tipRate = 0.10
        case 1: tipRate = 0.15
        case 2: tipRate = 0.20
        case 3: tipRate = 0.25
        default: tipRate = 0.00
            
        }
        
        let tipAmt = inputBill * tipRate
        let tipAndBill = inputBill + tipAmt
        
        tipAmountLabel.text = String(format: "Tip Amount = $%.2f", tipAmt)
        tipLabel.text = String(format:"Bill and Tip Total = $%.2f",tipAndBill)

    }
    
    @IBAction func dismissKeyboard(_ sender: AnyObject) {
        
        tipTextField.resignFirstResponder()
        
    }

}


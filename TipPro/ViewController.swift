//
//  ViewController.swift
//  TipPro
//
//  Created by STH on 2017/6/19.
//  Copyright © 2017年 STH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    @IBOutlet weak var tipAmountField: UITextField!
    @IBOutlet weak var totalAmountField: UITextField!

    @IBAction func calculateTip(_ sender: Any)
    {
        if let billAmount = Double(billAmountField.text!)
        {
            var tipPercentage = 0.0
            
            switch tipSelector.selectedSegmentIndex
            {
            case 0:
                tipPercentage = 0.15
            case 1:
                tipPercentage = 0.18
            case 2:
                tipPercentage = 0.20
            default:
                break
            }
            
            let roundedBillAmount = round(100 * billAmount) / 100
            let tipAmount = roundedBillAmount * tipPercentage
            let roundedTipAmount = round(100*tipAmount)/100
            let totalAmount = roundedBillAmount + roundedTipAmount
            
            if (!billAmountField.isEditing)
            {
                billAmountField.text = String(format: "%.2f", roundedBillAmount)
            }
            tipAmountField.text = String(format: "%.2f", roundedTipAmount)
            totalAmountField.text = String(format: "%.2f", totalAmount)
        }
        else
        {
            //show error
            billAmountField.text = ""
            tipAmountField.text = ""
            totalAmountField.text = ""
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        if touches.first != nil
        {
            self.view.endEditing(true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


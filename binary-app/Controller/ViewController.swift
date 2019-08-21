//
//  ViewController.swift
//  binary-app
//
//  Created by Carlos Pinder on 8/14/19.
//  Copyright © 2019 Carlos Pinder. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var valueEntryTextField: UITextField!
    @IBOutlet weak var binaryBtn: UIButton!
    @IBOutlet weak var decimalBtn: UIButton!
    
    let placeholder = NSAttributedString(string: "Enter a value...", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1) , NSAttributedString.Key.font: UIFont(name: "Menlo", size: 36.0)!])
    
    override func prepareForInterfaceBuilder() {
        valueEntryTextField.attributedPlaceholder = placeholder
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        valueEntryTextField.attributedPlaceholder = placeholder
        valueEntryTextField.addTarget(self, action: #selector(textFieldTextDidChange), for: .editingChanged)
        disableBtns()
        let binDigit = BinaryDecimal(145)
        print(binDigit.calculateBinaryValueForInt())
    }
    
    @objc func textFieldTextDidChange() {
        if (valueEntryTextField.text == "") {
           disableBtns()
        } else {
            enableBtns()
        }
    }
    
    func disableBtns(){
        binaryBtn.isEnabled = false
        binaryBtn.alpha = 0.5
        decimalBtn.isEnabled = false
        decimalBtn.alpha = 0.5
    }

    func enableBtns() {
        binaryBtn.isEnabled = true
        binaryBtn.alpha = 1.0
        decimalBtn.isEnabled = true
        decimalBtn.alpha = 1.0
    }
    
    @IBAction func binaryBtnWasPressed(_ sender: Any) {
        if valueEntryTextField.text != "" {
            binaryBtn.alpha = 1.0
            decimalBtn.alpha = 0.5
            
            let numbers = multipleNumberPull(delimitedNumbers: valueEntryTextField.text!)
            var binaries: String = String()
            
            numbers.forEach { (number) in
                let intFromString = Int(number)
                let binaryDigit = BinaryDecimal.init(intFromString!)
                binaries.append(binaryDigit.calculateBinaryValueForInt())
                binaries.append(contentsOf: " ")
            }
            
            if (binaries.last! == " ") {
                binaries.removeLast()
            }
            
            valueEntryTextField.text = binaries
        
            //guard let string = valueEntryTextField.text, let intFromString = Int(string) else { return }
            //let binaryDigit = BinaryDecimal.init(intFromString)
            //valueEntryTextField.text = "\(binaryDigit.calculateBinaryValueForInt())"
        }
    }
    
    @IBAction func decimalBtnWasPressed(_ sender: Any) {
        if valueEntryTextField.text != "" {
            binaryBtn.alpha = 0.5
            decimalBtn.alpha = 1.0
            
            guard let string = valueEntryTextField.text else { return }
            
            let numbers = multipleNumberPull(delimitedNumbers: string)
            var decimals: String = String()
            
            numbers.forEach { number in
                let bitsFromString = number.map{ Int(String($0))! }
                let binaryDigit = BinaryDecimal(bitsFromString)
                decimals.append(contentsOf:"\(binaryDigit.calculateIntValueForBinary())");
                decimals.append(contentsOf: " ")
            }
            
            if (decimals.last! == " ") {
                decimals.removeLast()
            }
            valueEntryTextField.text = decimals
        }
    }
    
    func multipleNumberPull(delimitedNumbers numbers: String) ->[Substring]
    {
        let multipleValues = numbers.split(separator: " ")
        return multipleValues;
    }
}


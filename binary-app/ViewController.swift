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
        
    }
    
    @IBAction func decimalBtnWasPressed(_ sender: Any) {
        
    }
    
}


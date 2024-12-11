//
//  ViewController.swift
//  Calculator2
//
//  Created by 전우정 on 12/10/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelDisplay: UILabel!

    var inTheMiddleOfTyping = false
    var firstValue = 0
    var op = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelDisplay.layer.cornerRadius = 10
        labelDisplay.layer.masksToBounds = true
    }

    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        print("digit : \(digit)")
        
        let currentText = labelDisplay.text!
        if inTheMiddleOfTyping && currentText != "0" {
            labelDisplay.text = currentText + digit
        } else {
            labelDisplay.text = digit
        }
        inTheMiddleOfTyping = true
    }
    
    @IBAction func operate(_ sender: UIButton) {
        op = sender.currentTitle!
        print("op : \(op)")
        
        firstValue = Int(labelDisplay.text!)!
        
        inTheMiddleOfTyping = false
    }
    
    @IBAction func touchCancel(_ sender: Any) {
        firstValue = 0
        labelDisplay.text = "0"
    }
    
    @IBAction func touchEqual(_ sender: Any) {
        let secondValue = Int(labelDisplay.text!)!
        var result = 0
        switch op {
        case "+": result = firstValue + secondValue
        case "-": result = firstValue - secondValue
        case "*": result = firstValue * secondValue
        case "/": result = firstValue / secondValue
        default: break
        }
        labelDisplay.text = String(result)
        firstValue = 0
    }
    
}

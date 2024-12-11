//
//  ViewController.swift
//  Calculator
//
//  Created by 전우정 on 12/9/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelDisplay: UILabel!
    
    
    private var firstNumber: Int?
    private var operation: Character?
    private var isNewNumber = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelDisplay.text = "0"
    
        // label의 배경을 둥글게 만듦
        labelDisplay.layer.cornerRadius = 10
        labelDisplay.layer.masksToBounds = true
    }
    
    @IBAction func touchDigit(_ sender: UIButton) {
        guard let digit = sender.currentTitle else { return }
        
        if "+-X/".contains(digit) {
            if let first = Int(labelDisplay.text ?? "0") {
                firstNumber = first
                operation = Character(digit)
                isNewNumber = true
            }
        } else {
            if isNewNumber {
                labelDisplay.text = digit
                isNewNumber = false
            } else {
                if labelDisplay.text == "0" {
                    labelDisplay.text = digit
                } else {
                    labelDisplay.text = (labelDisplay.text ?? "") + digit
                }
            }
        }
    }
    
    @IBAction func equalPressed(_ sender: UIButton) {
        guard let first = firstNumber,
              let second = Int(labelDisplay.text ?? "0"),
              let operation = operation else { return }
        
        let result = calculate(a: first, b: second, operation: operation)
        labelDisplay.text = String(result)
        firstNumber = nil
        self.operation = nil
        isNewNumber = true
    }
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        firstNumber = 0
        isNewNumber = false
        labelDisplay.text = "0"
    }
    
    
    func calculate(a: Int, b: Int, operation: Character) -> Int {
        switch operation {
        case "+": return a + b
        case "-": return a - b
        case "X": return a * b
        case "/": return b != 0 ? a / b : 0
        default: return 0
        }
    }
}

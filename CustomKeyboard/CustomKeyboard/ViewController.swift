//
//  ViewController.swift
//  CustomKeyboard
//
//  Created by Ted Hyeong on 20/01/2021.
//

import UIKit

class ViewController: UIViewController {
    
    private var currentNumber = ""

    @IBOutlet weak var firstTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true 
        
        let loadNib = Bundle.main.loadNibNamed("CustomKeyboard", owner: nil, options: nil)
        let myKeyboardView = loadNib?.first as! CustomKeyboard
        myKeyboardView.delegate = self
        firstTextField.inputView = myKeyboardView
    }
}

extension ViewController: CustomKeyboardDelegate {
    func keyboardTapped(number: String) {
        currentNumber += number
        
        firstTextField.text = currentNumber
        
//        let previousNumber = Int(firstTextField.text!)
//        var currentNumber = Int(number)
//
//        if number == "00" && previousNumber != nil {
//            currentNumber = previousNumber! * 100
//        }
//
//        if number == "000" && previousNumber != nil {
//            currentNumber = previousNumber! * 100
//        }
//
//
//
//        if let hasNumber = currentNumber {
//
//            let numberFormatter = NumberFormatter()
//            numberFormatter.numberStyle = .decimal
//
//            if let formatted = numberFormatter.string(from: NSNumber(value: hasNumber)) {
//                firstTextField.text = String(describing: formatted)
//            }
//        }
    }
}


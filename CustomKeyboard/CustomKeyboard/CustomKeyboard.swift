//
//  CustomKeyboard.swift
//  CustomKeyboard
//
//  Created by Ted Hyeong on 20/01/2021.
//

import UIKit

protocol CustomKeyboardDelegate {
    func keyboardTapped(number: String)
}

class CustomKeyboard: UIView {
    
    var delegate: CustomKeyboardDelegate?
    
    private func randomNumGenerator() -> [Int] {
        var nums = [0,1,2,3,4,5,6,7,8,9]
        var randomNumArray = [Int]()
        
        while nums.count > 0 {
            let arrayKey = Int(arc4random_uniform(UInt32(nums.count)))
            let randNum = nums[arrayKey]
            nums.remove(at: arrayKey)
            randomNumArray.append(randNum)
        }
        return randomNumArray
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let array = randomNumGenerator()
        
        for i in 1...10 {
            let button = viewWithTag(i) as! UIButton
            button.setTitle(String(describing: array[i-1]), for: .normal)
        }

        delegate?.keyboardTapped(number: sender.titleLabel!.text!)
        
    }
}

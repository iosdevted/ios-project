//
//  ViewController.swift
//  PopupLayout
//
//  Created by Ted Hyeong on 21/01/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(_ sender: Any) {
        
        let storyBoard = UIStoryboard.init(name: "PopupViewController", bundle: nil)
        
        let popupVC = storyBoard.instantiateViewController(withIdentifier: "popupVC")
        popupVC.modalPresentationStyle = .overCurrentContext
        
        self.present(popupVC, animated: false, completion: nil)
    }
    
}


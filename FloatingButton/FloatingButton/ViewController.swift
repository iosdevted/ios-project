//
//  ViewController.swift
//  FloatingButton
//
//  Created by Ted Hyeong on 20/01/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPopup" {
            let floatingVC = segue.destination as! FloatingButtonListViewController
            floatingVC.modalPresentationStyle = .overFullScreen
            //self.present(floatingVC, animated: true, completion: nil)
        }
    }


}


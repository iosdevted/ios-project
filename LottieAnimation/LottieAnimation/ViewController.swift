//
//  ViewController.swift
//  LottieAnimation
//
//  Created by Ted on 2021/02/12.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    @IBOutlet weak var animationView: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true 
        
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 0.5
        
        animationView!.play()
        
    }
}

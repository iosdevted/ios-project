//
//  ViewController.swift
//  rounded-navigationbar
//
//  Created by Ted on 2021/03/06.
//

import UIKit

protocol RoundedCornerNavigationBar {
    func addRoundedCorner(OnNavigationBar navigationBar: UINavigationBar, cornerRadius: CGFloat)
}

class ViewController: UIViewController, RoundedCornerNavigationBar {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }
    
    private func setupNavBar(){
        title = "Navigation Bar"
        navigationController?.navigationBar.prefersLargeTitles = true
        addRoundedCorner(OnNavigationBar: navigationController!.navigationBar, cornerRadius: 20)
    }
}

extension RoundedCornerNavigationBar where Self: UIViewController{
    
    func addRoundedCorner(OnNavigationBar navigationBar: UINavigationBar, cornerRadius: CGFloat){
        //navigationBar.isTranslucent = false
        //navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.backgroundColor = .white
        
        let customView = UIView(frame: CGRect(x: 0, y: navigationBar.bounds.maxY, width: navigationBar.bounds.width, height: cornerRadius))
        customView.backgroundColor = .clear
        navigationBar.insertSubview(customView, at: 1)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(roundedRect: customView.bounds, byRoundingCorners: [.bottomLeft,.bottomRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)).cgPath
        shapeLayer.shadowColor = UIColor.lightGray.cgColor
        shapeLayer.shadowOffset = CGSize(width: 0, height: 4.0)
        shapeLayer.shadowOpacity = 0.8
        shapeLayer.shadowRadius = 2
        shapeLayer.fillColor = UIColor.white.cgColor
        customView.layer.insertSublayer(shapeLayer, at: 0)
    }
}

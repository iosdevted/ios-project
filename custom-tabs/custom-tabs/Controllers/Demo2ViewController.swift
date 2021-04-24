//
//  Demo2ViewController.swift
//  custom-tabs
//
//  Created by Ted on 2021/03/07.
//

import UIKit

class Demo2ViewController: UIViewController {
    
    //MARK: - Properties
    
    var pageIndex: Int!
    
    private var label: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.tintColor = .black
        label.text = "Movie View Controller"
        return label
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}


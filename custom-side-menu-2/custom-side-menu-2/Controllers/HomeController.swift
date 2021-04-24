//
//  HomeController.swift
//  custom-side-menu-2
//
//  Created by Ted on 2021/03/03.
//

import UIKit

protocol HomeControllerDelegate: class {
    func handleMenuToggle()
}

class HomeController: UIViewController {
    
    //MARK: - Properties
    
    weak var delegate: HomeControllerDelegate?
    
    lazy var menubarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(sideMenuButtonTapped))
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureNavigationBarUI()
    }
    
    //MARk: - Selectors
    
    @objc func sideMenuButtonTapped() {
        delegate?.handleMenuToggle()
    }

    //MARK: - Helpers
    
    private func configureNavigationBarUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.setLeftBarButton(menubarButtonItem, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .white
        navigationController?.navigationBar.topItem?.title = "Main"
    }
}


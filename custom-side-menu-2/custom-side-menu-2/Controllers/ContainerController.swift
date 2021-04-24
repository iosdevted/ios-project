//
//  ContainerController.swift
//  custom-side-menu-2
//
//  Created by Ted on 2021/03/03.
//

import UIKit

class ContainerController: UIViewController {
    
    //MARK: - Properties
    
    private let homeController = HomeController()
    private var centerController: UIViewController!
    private var menuController: MenuController!
    private var isExpaned = false
    private let blackView = UIView()
    private lazy var xOrigin = self.view.frame.width - 80
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override var prefersStatusBarHidden: Bool {
        return isExpaned
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    // MARK: - Selectors
    
    @objc func dismissMenu() {
        isExpaned = false
        animateMenu(shouldExpand: isExpaned)
    }
    
    
    //MARK: - Helpers
    
    func configure() {
        view.backgroundColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1.0)
        configureHomeNavigationController()
        configureMenuController()
    }
    
    func configureHomeNavigationController() {
        centerController = UINavigationController(rootViewController: homeController)
        
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
        
        homeController.delegate = self
    }
    
    func configureMenuController() {
        menuController = MenuController()
        
        view.insertSubview(menuController.view, at: 0)
        addChild(menuController)
        menuController.didMove(toParent: self)
        
        menuController.view.frame = CGRect(x: 0, y: 0, width: xOrigin + 5, height: self.view.frame.height)
        menuController.delegate = self
        
        configureBlackView()
    }
    
    func configureBlackView() {
        blackView.frame = CGRect(x: xOrigin, y: 0, width: xOrigin, height: self.view.frame.height)
        blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        blackView.alpha = 0
        view.addSubview(blackView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissMenu))
        blackView.addGestureRecognizer(tap)
    }
    
    func animateMenu(shouldExpand: Bool, completion: ((Bool) -> Void)? = nil) {
        if shouldExpand {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                
                self.centerController.view.frame.origin.x = self.xOrigin
                self.blackView.alpha = 1

            }, completion: nil)
            
        } else {
            self.blackView.alpha = 0
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = 0
                self.blackView.alpha = 0

            }, completion: completion)
        }
        
        animateStatusBar()
    }
    
    func animateStatusBar() {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
    }
}

//MARK: - HomeControllerDelegate

extension ContainerController: HomeControllerDelegate {
    func handleMenuToggle() {

        isExpaned.toggle()
        animateMenu(shouldExpand: isExpaned)
    }
}

//MARK: - MenuControllerDelegate

extension ContainerController: MenuControllerDelegate {
    func didSelect(options: MenuOptions) {
        isExpaned.toggle()
        animateMenu(shouldExpand: isExpaned) { _ in
            switch options {
            case .profile:
                print("Show Profile")
            case .settings:
                print("Show Settings")
            case .logout:
                print("Show Logout")
            }
        }
    }
}

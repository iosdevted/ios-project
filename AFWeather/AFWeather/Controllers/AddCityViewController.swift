//
//  AddCityController.swift
//  AFWeather
//
//  Created by Ted on 2021/03/01.
//

import UIKit
import SnapKit
import Loaf

class AddCityViewController: UIViewController {
    
    //MARK: - Properties
    
    private let weatherManager = WeatherManager()
    
    var delegate: ViewControllerDelegate?
    
    private lazy var uiView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 2.0
        
        let stack = UIStackView(arrangedSubviews: [cityLabel, textfield, searchButton, statusLabel])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.alignment = .center
        view.addSubview(stack)
        
        stack.snp.makeConstraints{ (make) -> Void in
            make.centerX.centerY.equalToSuperview()
        }
        
        return view
    }()
    
    private var cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Light", size: 18)
        label.textAlignment = .center
        label.text = "Enter the city name"
        return label
    }()
    
    private let textfield: UITextField = {
        let textfield = UITextField()
        textfield.isSecureTextEntry = false
        textfield.layer.cornerRadius = 7
        textfield.layer.borderColor = UIColor.lightGray.cgColor
        textfield.layer.borderWidth = 1.0
        textfield.becomeFirstResponder()
        
        textfield.snp.makeConstraints{ (make) -> Void in
            make.size.equalTo(CGSize(width: 170, height: 25))
        }
        
        return textfield
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Search", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 98/255, green: 149/255, blue: 156/255, alpha: 1/1)
        button.layer.cornerRadius = 7
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1.0
        
        button.snp.makeConstraints{ (make) -> Void in
            make.size.equalTo(CGSize(width: 170, height: 25))
        }
        
        button.addTarget(self, action: #selector(handleSearch), for: .touchUpInside)
        return button
    }()
    
    private var statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Light", size: 18)
        label.textAlignment = .center
        label.text = "Status"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        label.snp.makeConstraints{ (make) -> Void in
            make.width.equalTo(170)
            make.height.greaterThanOrEqualTo(50)
        }
        
        return label
    }()
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setupGestures()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        statusLabel.isHidden = true
    }
    
    //MARK: - Selectors
    
    @objc func handleSearch() {
        guard let query = textfield.text, !query.isEmpty else {
            return showSearchError(text: "Please try again!")
        }
        searchForCity(query: query)
    }
    
    @objc func dismissViewController() {
        dismiss(animated: false, completion: nil)
    }
    
    //MARK: - Helpers
    
    private func configureUI() {
        view.backgroundColor = UIColor.init(white: 0.3, alpha: 0.4)
        view.addSubview(uiView)
        
        uiView.snp.makeConstraints{ (make) -> Void in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(250)
            make.height.greaterThanOrEqualTo(150)
        }
    }
    
    private func searchForCity(query: String) {
        view.endEditing(true)
        weatherManager.fetchWeather(byCity: query) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                self.handleSearchSuccess(model: model)
            case .failure(let error):
                self.showSearchError(text: error.localizedDescription)
            }
        }
    }
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissViewController))
        tapGesture.delegate = self
        view.addGestureRecognizer(tapGesture)
    }
    
    private func showSearchError(text: String) {
//        statusLabel.isHidden = false
//        statusLabel.textColor = .systemRed
//        statusLabel.text = text
        Loaf(text, state: .error, location: .top, sender: self).show()
    }
    
    private func handleSearchSuccess(model: WeatherModel) {
//        statusLabel.isHidden = false
//        statusLabel.textColor = UIColor(red: 98/255, green: 149/255, blue: 156/255, alpha: 1/1)
//        statusLabel.text = "Success!"
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            guard let self = self else { return }
            self.delegate?.didUpdateWeatherFromSearch(model: model)
        }
    }
}

//MARK: - UIGestureRecognizerDelegate

extension AddCityViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view == self.view
    }
}

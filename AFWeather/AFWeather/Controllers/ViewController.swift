//
//  ViewController.swift
//  AFWeather
//
//  Created by Ted on 2021/02/24.
//

import UIKit
import SnapKit
import SkeletonView
import CoreLocation
import Loaf

protocol ViewControllerDelegate {
    func didUpdateWeatherFromSearch(model: WeatherModel)
}

class ViewController: UIViewController {
    
    //MARK: - Properties
    
    private let weatherManager = WeatherManager()
    
    private lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.delegate = self
        return manager
    }()
    
    private var imageview: UIImageView = {
        let image = UIImage(named: "imClouds")
        image?.withRenderingMode(.alwaysOriginal)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.isSkeletonable = true
        return imageView
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.isSkeletonable = true
        
        label.snp.makeConstraints{ (make) -> Void in
            make.size.equalTo(CGSize(width: 250, height: 50))
        }
        
        return label
    }()
    
    private lazy var conditionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.text = "Mostly Cloudy"
        label.textAlignment = .center
        label.isSkeletonable = true
        
        label.snp.makeConstraints{ (make) -> Void in
            make.size.equalTo(CGSize(width: 250, height: 50))
        }
        
        return label
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationBar()
        configureUI()
        
        showAnimation()
        fetchWeather(byCity: "Tokyo")
    }
    
    //MARK: - Selectors
    
    @objc func addTapped() {
        let nav = AddCityViewController()
        nav.modalPresentationStyle = .overFullScreen
        nav.delegate = self
        self.present(nav, animated: false, completion: nil)
    }
    
    @objc func locationTapped() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.requestLocation()
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            locationManager.requestLocation()
        default:
            promptForLocationPermission()
        }
    }
    
    //MARK: - Helpers
    
    private func promptForLocationPermission() {
        let alertController = UIAlertController(title: "Requires Location Permission", message: "Would you like to enable location permission in Settings?", preferredStyle: .alert)
        let enableAction = UIAlertAction(title: "Go to Settings", style: .default) { _ in
            guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else { return }
            UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(enableAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func showAnimation() {
        imageview.showAnimatedGradientSkeleton()
        temperatureLabel.showAnimatedGradientSkeleton()
        conditionLabel.showAnimatedGradientSkeleton()
    }
    
    private func hideAnimation() {
        imageview.hideSkeleton()
        temperatureLabel.hideSkeleton()
        conditionLabel.hideSkeleton()
    }
    
    private func updateView(with model: WeatherModel) {
        hideAnimation()
        
        temperatureLabel.text = model.temp.toString().appending("°C")
        conditionLabel.text = model.conditionDescription
        navigationItem.title = model.countryName
        imageview.image = UIImage(named: model.conditionImage)
    }
    
    private func fetchWeather(byLocation location: CLLocation) {
        let lat = location.coordinate.latitude
        let lon = location.coordinate.longitude
        weatherManager.fetchWeather(lat: lat, lon: lon) { [weak self] result in
            guard let self = self else { return }
            self.handleResult(result)
        }
    }
    
    private func fetchWeather(byCity city: String) {
        weatherManager.fetchWeather(byCity: city) {[weak self] result in
            guard let self = self else { return }
            self.handleResult(result)
        }
    }
    
    private func handleResult(_ result: Result<WeatherModel, Error>) {
        switch result {
        case .success(let model):
            updateView(with: model)
        case .failure(let error):
            hideAnimation()
            Loaf(error.localizedDescription, state: .error, location: .bottom, sender: self).show()
        }
    }
    
    private func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance
        
        navigationController?.navigationBar.topItem?.title = "AFWeather"
        navigationController?.navigationBar.tintColor = .black
        
        var image = UIImage(systemName: "location")
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style:.plain, target: self, action:  #selector(locationTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    private func configureUI() {
        view.addSubview(imageview)
        
        imageview.snp.makeConstraints{ (make) -> Void in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50)
            make.size.equalTo(CGSize(width: 250, height: 250))
        }
        
        let stack = UIStackView(arrangedSubviews: [temperatureLabel, conditionLabel])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.alignment = .center
        view.addSubview(stack)
        
        stack.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(imageview.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
    }
}

//MARK: - ViewControllerDelegate

extension ViewController: ViewControllerDelegate {
    func didUpdateWeatherFromSearch(model: WeatherModel) {
        presentedViewController?.dismiss(animated: false, completion: { [weak self] in
            guard let self = self else { return }
            self.updateView(with: model)
        })
    }
}

//MARK: - CLLocationManagerDelegate

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            manager.stopUpdatingLocation()
            fetchWeather(byLocation: location)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        Loaf(error.localizedDescription, state: .error, location: .bottom, sender: self).show()
    }
}

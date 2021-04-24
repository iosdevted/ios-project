//
//  ViewController.swift
//  then-snapkit-rxswift
//
//  Created by Ted on 2021/04/17.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Then

protocol ViewBindable {
    var buttonAction: Signal<Menu> { get }
    var buttonTapped: PublishRelay<Menu> { get }
}

class ViewController: UIViewController {

    var disposeBag = DisposeBag()
    
    let titleLabel = UILabel()
    let howToUserButton = UIButton()
    
    let illustImagView = UIImageView(image: #imageLiteral(resourceName: "illust0"))
    
    let aboutLabel = UILabel()
    let ratingButton = UIButton()
    let sendMailButton = UIButton()
    let gitHubButton = UIButton()
    let linkedinButton = UIButton()
    let instagramButton = UIButton()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func bind(_ viewModel: ViewBindable) {
        self.disposeBag = DisposeBag()
        viewModel.buttonAction
            .emit(to: self.rx.buttonAction)
            .disposed(by: disposeBag)
        
        howToUserButton.rx.tap
            .map { Menu.howToUse }
            .bind(to: viewModel.buttonTapped)
            .disposed(by: disposeBag)
        
        ratingButton.rx.tap
            .map { Menu.rating }
            .bind(to: viewModel.buttonTapped)
            .disposed(by: disposeBag)
        
        sendMailButton.rx.tap
            .map { Menu.sendMail }
            .bind(to: viewModel.buttonTapped)
            .disposed(by: disposeBag)
        
        gitHubButton.rx.tap
            .map { Menu.gitHub }
            .bind(to: viewModel.buttonTapped)
            .disposed(by: disposeBag)
        
        linkedinButton.rx.tap
            .map { Menu.linkedin }
            .bind(to: viewModel.buttonTapped)
            .disposed(by: disposeBag)
        
        instagramButton.rx.tap
            .map { Menu.instagram }
            .bind(to: viewModel.buttonTapped)
            .disposed(by: disposeBag)
    }
    
    func attribute() {
        view.backgroundColor = .white
        
        titleLabel.do {
            $0.text = "title"
            $0.textColor = .black
            $0.font = .monospacedSystemFont(ofSize: 34, weight: .black)
            $0.numberOfLines = 1
        }
        
        howToUserButton.do {
            $0.setTitle("START", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .monospacedSystemFont(ofSize: 20, weight: .bold)
            $0.backgroundColor = UIColor(named: "button")
            $0.layer.cornerRadius = 10
            $0.clipsToBounds = true
        }
        
        aboutLabel.do {
            $0.text = "About"
            $0.textColor = .lightGray
            $0.font = .monospacedSystemFont(ofSize: 14, weight: .bold)
            $0.numberOfLines = 1
        }
        
        ratingButton.do {
            $0.setTitle("Rate GitGet", for: .normal)
            $0.titleLabel?.font = .monospacedSystemFont(ofSize: 18, weight: .bold)
            $0.setTitleColor(.darkGray, for: .normal)
        }
        
        sendMailButton.do {
            $0.setTitle("Support", for: .normal)
            $0.titleLabel?.font = .monospacedSystemFont(ofSize: 18, weight: .bold)
            $0.setTitleColor(.darkGray, for: .normal)
        }
        
        gitHubButton.do {
            $0.setImage(#imageLiteral(resourceName: "logo_github"), for: .normal)
        }
        
        linkedinButton.do {
            $0.setImage(#imageLiteral(resourceName: "logo_linkedin"), for: .normal)
        }
        
        instagramButton.do {
            $0.setImage(#imageLiteral(resourceName: "logo_instagram"), for: .normal)
        }
    }
    
    func layout() {
        [
            titleLabel,
            illustImagView,
            howToUserButton,
            aboutLabel,
            ratingButton,
            sendMailButton,
            gitHubButton, linkedinButton, instagramButton
        ].forEach {
            view.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets.bottom).offset(120)
            $0.leading.equalToSuperview().offset(25)
        }
        
        howToUserButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(72)
        }
        
        illustImagView.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-50)
            $0.leading.equalToSuperview().offset(78)
            $0.width.equalTo(304)
            $0.height.equalTo(355)
        }
        
        gitHubButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaInsets.bottom).offset(-80)
            $0.leading.equalToSuperview().offset(25)
            $0.width.height.equalTo(30)
        }
        
        linkedinButton.snp.makeConstraints {
            $0.centerY.equalTo(gitHubButton)
            $0.leading.equalTo(gitHubButton.snp.trailing).offset(12)
            $0.width.height.equalTo(30)
        }
        
        instagramButton.snp.makeConstraints {
            $0.centerY.equalTo(gitHubButton)
            $0.leading.equalTo(linkedinButton.snp.trailing).offset(12)
            $0.width.height.equalTo(30)
        }
        
        sendMailButton.snp.makeConstraints {
            $0.bottom.equalTo(gitHubButton.snp.top).offset(-24)
            $0.leading.equalToSuperview().offset(25)
        }
        
        ratingButton.snp.makeConstraints {
            $0.bottom.equalTo(sendMailButton.snp.top).offset(-16)
            $0.leading.equalToSuperview().offset(25)
        }
        
        aboutLabel.snp.makeConstraints {
            $0.bottom.equalTo(ratingButton.snp.top).offset(-21)
            $0.leading.equalToSuperview().offset(25)
        }
    }
}


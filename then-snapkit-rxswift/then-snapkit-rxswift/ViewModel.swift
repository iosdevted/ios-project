//
//  ViewModel.swift
//  then-snapkit-rxswift
//
//  Created by Ted on 2021/04/17.
//

import RxSwift
import RxCocoa
import RxDataSources

enum Menu {
    case howToUse
    case rating
    case sendMail
    case gitHub
    case linkedin
    case instagram
}

struct ViewModel: ViewBindable {
    let disposeBag = DisposeBag()
    
    let buttonAction: Signal<Menu>
    let buttonTapped = PublishRelay<Menu>()
    init() {
        buttonAction = buttonTapped
            .asSignal(onErrorSignalWith: .empty())
    }
}


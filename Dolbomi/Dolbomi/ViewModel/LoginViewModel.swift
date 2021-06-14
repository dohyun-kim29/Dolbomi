//
//  LoginViewModel.swift
//  Dolbomi
//
//  Created by DohyunKim on 2021/06/14.
//

import Foundation
import RxSwift
import RxCocoa

final class LoginViewModel {
    
    let disposeBag = DisposeBag()
    
    struct Input {
        let urlTextFieldDriver: Driver<String>
        let confirmButtonSignal: Signal<Void>
    }
    
    struct Output {
        
    }
    
    
    func login(_ input: Input) {
        input.confirmButtonSignal.asObservable()
            .subscribe(onNext: { _ in
                UserDefaults.standard.setValue(input.urlTextFieldDriver, forKey: "hostUrl")
            }).disposed(by: disposeBag)
    }
    
    
}

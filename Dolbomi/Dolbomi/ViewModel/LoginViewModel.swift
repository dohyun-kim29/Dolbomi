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
        let urlTextFieldSubject: Driver<String>
        let confirmButtonSignal: Signal<Bool>
    }
    
    struct Output {
        
    }
    
    func transform(_ input: Input) {
        input.confirmButtonSignal.asObservable()
            .subscribe(onNext: { _ in
                UserDefaults.standard.setValue(input.urlTextFieldSubject, forKey: "hostUrl")
            }).disposed(by: disposeBag)
    }
    
    
}

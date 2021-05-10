//
//  DevIntroduceViewModel.swift
//  Dolbomi
//
//  Created by DohyunKim on 2021/05/06.
//

import Foundation
import RxSwift
import RxCocoa

class DevIntroduceViewModel {
    
    let model = DevIntroduceModel()
    let output: Output
    
    struct Output {
        let devIntroduceData: Observable<[Dev]>
    }
    
    init() {
        output = Output.init(devIntroduceData: Observable.of(model.devArr))
    }
    
}


//
//  DolbomiAPIClient.swift
//  Dolbomi
//
//  Created by DohyunKim on 2021/05/24.
//

import Foundation
import RxSwift
import Alamofire
import RxAlamofire
import Moya

class DolbomiAPIClient {
    static let shared = DolbomiAPIClient()
    func networking<T: Codable>(from api: DolbomiAPI) -> Observable<T> {
        Observable.create { (obs) -> Disposable in
            if NetworkReachabilityManager()!.isReachable {
//                let provider = MoyaProvider<DolbomiAPI>()
                
            } else {
                obs.onError(ErrCode.internalServerError)
                return  Disposables.create()
            }
            return Disposables.create {
                
            }
        }
    }
}

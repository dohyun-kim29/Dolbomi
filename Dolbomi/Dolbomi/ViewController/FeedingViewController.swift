//
//  SettingViewController.swift
//  Dolbomi
//
//  Created by DohyunKim on 2021/05/03.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class FeedingViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    let backButton = UIButton().then {
        $0.setImage(UIImage(named: "arrow"), for: .normal)
        $0.snp.makeConstraints {
            $0.width.equalTo(30)
            $0.height.equalTo(20)
        }
    }
    
    let titleLabel = UILabel().then {
        $0.text = "실시간 급여"
        $0.textColor = .white
        $0.font = UIFont(name: "Maplestory OTF Bold", size: 40)
    }
//
//    let pushStackView = UIView().then {
//        $0.backgroundColor = .white
//        $0.layer.cornerRadius = 20
//        $0.snp.makeConstraints {
//            $0.height.equalTo(100)
//        }
//    }
//
//    let pushTitleLabel = UILabel().then {
//        $0.text = "푸시 알림 설정"
//        $0.font = UIFont(name: "Maplestory OTF Bold", size: 25)
//        $0.textColor = UIColor(named: "DolbomiLabelColor")
//    }
//
//    let pushSubTitleLabel = UILabel().then {
//        $0.text = "알림이 오지 않아요"
//        $0.font = UIFont(name: "Maplestory OTF Light", size: 15)
//        $0.textColor = UIColor(named: "DolbomiLabelColor")
//    }
//
//    let pushSwitch = UISwitch()
//
//    let devStackView = UIView().then {
//        $0.backgroundColor = .white
//        $0.layer.cornerRadius = 20
//        $0.snp.makeConstraints {
//            $0.height.equalTo(100)
//        }
//    }
//
//    let devTitleLabel = UILabel().then {
//        $0.text = "개발자 소개"
//        $0.font = UIFont(name: "Maplestory OTF Bold", size: 25)
//        $0.textColor = UIColor(named: "DolbomiLabelColor")
//    }
//
//    let devSubTitleLabel = UILabel().then {
//        $0.text = "Dolbomi 개발자들을 소개합니다"
//        $0.font = UIFont(name: "Maplestory OTF Light", size: 15)
//        $0.textColor = UIColor(named: "DolbomiLabelColor")
//   }
//
//    let devStackButton = UIButton().then {
//        $0.tintColor = .clear
//        $0.backgroundColor = .clear
//        $0.layer.cornerRadius = 20
//        $0.snp.makeConstraints {
//            $0.height.equalTo(100)
//        }
//    }
    
    let feedAmountStackView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
        $0.snp.makeConstraints {
            $0.height.equalTo(100)
        }
    }
    
    let feedAmountTitleLabel = UILabel().then {
        $0.text = "어느정도 양을 배식할까요?"
        $0.font = UIFont(name: "Maplestory OTF Bold", size: 23)
        $0.textColor = UIColor(named: "DolbomiLabelColor")
    }
    
    let feedAmountButton = UIButton().then {
        $0.tintColor = .clear
        $0.backgroundColor = .clear
        $0.layer.cornerRadius = 20
        $0.snp.makeConstraints {
            $0.height.equalTo(100)
        }
    }
    
    let confirmButton = UIButton().then {
        $0.backgroundColor = UIColor.init(named: "DolbomiDarkColor")
        $0.setTitle("완료", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Maplestory OTF Bold", size: 17)
        $0.layer.cornerRadius = 13
        $0.snp.makeConstraints {
            $0.width.equalTo(200)
            $0.height.equalTo(40)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        makeConst()
        bind()
    }
    
    func makeUI() {
        view.backgroundColor = UIColor(named: "DolbomiMainColor")
        view.addSubview(backButton)
        view.addSubview(titleLabel)
//
//        view.addSubview(pushStackView)
//        view.addSubview(pushTitleLabel)
//        view.addSubview(pushSubTitleLabel)
//        view.addSubview(pushSwitch)
//
//        view.addSubview(devStackView)
//        view.addSubview(devTitleLabel)
//        view.addSubview(devSubTitleLabel)
//        view.addSubview(devStackButton)
        view.addSubview(feedAmountStackView)
        view.addSubview(feedAmountTitleLabel)
        view.addSubview(feedAmountButton)
        
        view.addSubview(confirmButton)
    }
    
    func makeConst() {
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.leading.equalToSuperview().offset(30)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(backButton).offset(40)
            $0.leading.equalToSuperview().offset(30)
        }
//
//        pushStackView.snp.makeConstraints {
//            $0.top.equalTo(titleLabel).offset(120)
//            $0.leading.equalToSuperview().offset(40)
//            $0.trailing.equalToSuperview().offset(-40)
//        }
//        pushTitleLabel.snp.makeConstraints {
//            $0.top.equalTo(pushStackView).offset(20)
//            $0.leading.equalTo(pushStackView).offset(30)
//        }
//        pushSubTitleLabel.snp.makeConstraints {
//            $0.top.equalTo(pushTitleLabel).offset(40)
//            $0.leading.equalTo(pushTitleLabel)
//        }
//        pushSwitch.snp.makeConstraints {
//            $0.top.equalTo(pushTitleLabel).offset(15)
//            $0.leading.equalTo(pushTitleLabel).offset(185)
//        }
//
//        devStackView.snp.makeConstraints {
//            $0.top.equalTo(pushSubTitleLabel).offset(150)
//            $0.leading.equalToSuperview().offset(40)
//            $0.trailing.equalToSuperview().offset(-40)
//        }
//        devTitleLabel.snp.makeConstraints {
//            $0.top.equalTo(devStackView).offset(20)
//            $0.leading.equalTo(devStackView).offset(30)
//        }
//        devSubTitleLabel.snp.makeConstraints {
//            $0.top.equalTo(devTitleLabel).offset(40)
//            $0.leading.equalTo(devTitleLabel)
//        }
//        devStackButton.snp.makeConstraints {
//            $0.center.equalTo(devStackView)
//            $0.width.equalTo(devStackView)
//        }
        
        feedAmountStackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel).offset(160)
            $0.leading.equalToSuperview().offset(40)
            $0.trailing.equalToSuperview().offset(-40)
        }
        feedAmountTitleLabel.snp.makeConstraints {
            $0.top.equalTo(feedAmountStackView).offset(20)
            $0.leading.equalTo(feedAmountStackView).offset(30)
        }
        feedAmountButton.snp.makeConstraints {
            $0.center.equalTo(feedAmountStackView)
            $0.width.equalTo(feedAmountStackView)
        }
        confirmButton.snp.makeConstraints {
            $0.top.equalTo(feedAmountButton).offset(150)
            $0.trailing.equalToSuperview().offset(-85)
            $0.leading.equalToSuperview().offset(85)
        }
        
    }
    
    func bind() {
        backButton.rx.tap
            .bind {
                self.backDismiss()
            }.disposed(by: disposeBag)
    }
    
    func backDismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
}

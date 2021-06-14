//
//  AutoFeedViewController.swift
//  Dolbomi
//
//  Created by DohyunKim on 2021/04/27.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Then

class AutoFeedViewController: UIViewController {
    
    let disposebag = DisposeBag()
    
    let backButton = UIButton().then {
        $0.setImage(UIImage(named: "arrow"), for: .normal)
        $0.snp.makeConstraints {
            $0.width.equalTo(30)
            $0.height.equalTo(20)
        }
    }
    
    let titleLabel = UILabel().then {
        $0.text = "자동 배식"
        $0.textColor = .white
        $0.font = UIFont(name: "Maplestory OTF Bold", size: 40)
    }
    
    let autoFeedStackView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
        $0.snp.makeConstraints {
            $0.height.equalTo(100)
        }
    }
    
    let autoFeedTitleLabel = UILabel().then {
        $0.text = "몇 시간마다 배식을 할까요?"
        $0.font = UIFont(name: "Maplestory OTF Bold", size: 22)
        $0.textColor = UIColor(named: "DolbomiLabelColor")
    }
    
    let autoFeedButton = UIButton().then {
        $0.tintColor = .clear
        $0.backgroundColor = .clear
        $0.layer.cornerRadius = 20
        $0.snp.makeConstraints {
            $0.height.equalTo(100)
        }
    }
    
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
    
//    let autoFeedButton6: UIButton = {
//        let button = UIButton()
//        button.setTitle("6", for: .normal)
//        button.titleLabel?.font = UIFont(name: "Maplestory OTF Bold", size: 23)
//
//        return button
//    }()
//
//    let autoFeedButton12: UIButton = {
//        let button = UIButton()
//        button.setTitle("12", for: .normal)
//        button.titleLabel?.font = UIFont(name: "Maplestory OTF Bold", size: 23)
//
//        return button
//    }()
//
//    let autoFeedButton24: UIButton = {
//        let button = UIButton()
//        button.setTitle("24", for: .normal)
//        button.titleLabel?.font = UIFont(name: "Maplestory OTF Bold", size: 23)
//
//        return button
//    }()
//
//    let autoFeedButton48: UIButton = {
//        let button = UIButton()
//        button.setTitle("48", for: .normal)
//        button.titleLabel?.font = UIFont(name: "Maplestory OTF Bold", size: 23)
//
//        return button
//    }()
    
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
        
        view.addSubview(autoFeedStackView)
        view.addSubview(autoFeedTitleLabel)
        view.addSubview(autoFeedButton)
        
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
        
        autoFeedStackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel).offset(90)
            $0.leading.equalToSuperview().offset(40)
            $0.trailing.equalToSuperview().offset(-40)
        }
        autoFeedTitleLabel.snp.makeConstraints {
            $0.top.equalTo(autoFeedStackView).offset(20)
            $0.leading.equalTo(autoFeedStackView).offset(30)
        }
        autoFeedButton.snp.makeConstraints {
            $0.center.equalTo(autoFeedStackView)
            $0.width.equalTo(autoFeedStackView)
        }
        
        feedAmountStackView.snp.makeConstraints {
            $0.top.equalTo(autoFeedButton).offset(200)
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
            }.disposed(by: disposebag)
    }
    
    func backDismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

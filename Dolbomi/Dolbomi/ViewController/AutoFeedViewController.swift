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

class AutoFeedViewController: UIViewController {
    
    let backButton: UIButton = {
        let backButton = UIButton()
        backButton.setImage(UIImage(named: "arrow"), for: .normal)
        backButton.snp.makeConstraints {
            $0.width.equalTo(30)
            $0.height.equalTo(20)
        }
        return backButton
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "자동 배식"
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "Maplestory OTF Bold", size: 40)
        return titleLabel
    }()
    
    let autoFeedStackView: UIView = {
        let stackView = UIView()
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 20
        stackView.snp.makeConstraints {
            $0.height.equalTo(100)
        }
        return stackView
    }()
    
    let autoFeedTitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "몇 시간마다 배식을 할까요?"
        titleLabel.font = UIFont(name: "Maplestory OTF Bold", size: 22)
        titleLabel.textColor = UIColor(named: "DolbomiLabelColor")
        return titleLabel
    }()
    
    let autoFeedButton: UIButton = {
        let stackButton = UIButton()
        stackButton.tintColor = .clear
        stackButton.backgroundColor = .clear
        stackButton.layer.cornerRadius = 20
        stackButton.snp.makeConstraints {
            $0.height.equalTo(100)
        }
        return stackButton
    }()
    
    let feedAmountStackView: UIView = {
        let stackView = UIView()
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 20
        stackView.snp.makeConstraints {
            $0.height.equalTo(100)
        }
        return stackView
    }()
    
    let feedAmountTitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "어느정도 양을 배식할까요?"
        titleLabel.font = UIFont(name: "Maplestory OTF Bold", size: 23)
        titleLabel.textColor = UIColor(named: "DolbomiLabelColor")
        return titleLabel
    }()
    
    let feedAmountButton: UIButton = {
        let stackButton = UIButton()
        stackButton.tintColor = .clear
        stackButton.backgroundColor = .clear
        stackButton.layer.cornerRadius = 20
        stackButton.snp.makeConstraints {
            $0.height.equalTo(100)
        }
        return stackButton
    }()
    
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
    
    let confirmButton: UIButton = {
        let confirmButton = UIButton()
        confirmButton.backgroundColor = UIColor.init(named: "DolbomiDarkColor")
        confirmButton.setTitle("완료", for: .normal)
        confirmButton.setTitleColor(.white, for: .normal)
        confirmButton.titleLabel?.font = UIFont(name: "Maplestory OTF Bold", size: 17)
        confirmButton.layer.cornerRadius = 13
        confirmButton.snp.makeConstraints {
            $0.width.equalTo(200)
            $0.height.equalTo(40)
        }
        return confirmButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        makeConst()
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
    
    
}

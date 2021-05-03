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

class SettingViewController: UIViewController {
    
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
        titleLabel.text = "설정"
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "Maplestory OTF Bold", size: 40)
        return titleLabel
    }()
    
    let pushStackView: UIView = {
        let stackView = UIView()
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 20
        stackView.snp.makeConstraints {
            $0.height.equalTo(100)
        }
        return stackView
    }()
    
    let pushTitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "푸시 알림 설정"
        titleLabel.font = UIFont(name: "Maplestory OTF Bold", size: 25)
        titleLabel.textColor = UIColor(named: "DolbomiLabelColor")
        return titleLabel
    }()
    
    let pushSubTitleLabel: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.text = "알림이 오지 않아요"
        subtitleLabel.font = UIFont(name: "Maplestory OTF Light", size: 15)
        subtitleLabel.textColor = UIColor(named: "DolbomiLabelColor")
        return subtitleLabel
    }()
    
    let pushSwitch: UISwitch = {
        let pushSwitch = UISwitch()
        return pushSwitch
    }()
    
    let devStackView: UIView = {
        let stackView = UIView()
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 20
        stackView.snp.makeConstraints {
            $0.height.equalTo(100)
        }
        return stackView
    }()
    
    let devTitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "개발자 소개"
        titleLabel.font = UIFont(name: "Maplestory OTF Bold", size: 25)
        titleLabel.textColor = UIColor(named: "DolbomiLabelColor")
        return titleLabel
    }()
    
    let devSubTitleLabel: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.text = "Dolbomi 개발자들을 소개합니다"
        subtitleLabel.font = UIFont(name: "Maplestory OTF Light", size: 15)
        subtitleLabel.textColor = UIColor(named: "DolbomiLabelColor")
        return subtitleLabel
    }()
    
    let devStackButton: UIButton = {
        let stackButton = UIButton()
        stackButton.tintColor = .clear
        stackButton.backgroundColor = .clear
        stackButton.layer.cornerRadius = 20
        stackButton.snp.makeConstraints {
            $0.height.equalTo(100)
        }
        return stackButton
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
        
        view.addSubview(pushStackView)
        view.addSubview(pushTitleLabel)
        view.addSubview(pushSubTitleLabel)
        view.addSubview(pushSwitch)
        
        view.addSubview(devStackView)
        view.addSubview(devTitleLabel)
        view.addSubview(devSubTitleLabel)
        view.addSubview(devStackButton)
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
        
        pushStackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel).offset(120)
            $0.leading.equalToSuperview().offset(40)
            $0.trailing.equalToSuperview().offset(-40)
        }
        pushTitleLabel.snp.makeConstraints {
            $0.top.equalTo(pushStackView).offset(20)
            $0.leading.equalTo(pushStackView).offset(30)
        }
        pushSubTitleLabel.snp.makeConstraints {
            $0.top.equalTo(pushTitleLabel).offset(40)
            $0.leading.equalTo(pushTitleLabel)
        }
        pushSwitch.snp.makeConstraints {
            $0.top.equalTo(pushTitleLabel).offset(15)
            $0.leading.equalTo(pushTitleLabel).offset(185)
        }
        
        devStackView.snp.makeConstraints {
            $0.top.equalTo(pushSubTitleLabel).offset(150)
            $0.leading.equalToSuperview().offset(40)
            $0.trailing.equalToSuperview().offset(-40)
        }
        devTitleLabel.snp.makeConstraints {
            $0.top.equalTo(devStackView).offset(20)
            $0.leading.equalTo(devStackView).offset(30)
        }
        devSubTitleLabel.snp.makeConstraints {
            $0.top.equalTo(devTitleLabel).offset(40)
            $0.leading.equalTo(devTitleLabel)
        }
        devStackButton.snp.makeConstraints {
            $0.center.equalTo(devStackView)
            $0.width.equalTo(devStackView)
        }
        
    }
    
}

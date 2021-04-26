//
//  MainViewController.swift
//  Dolbomi
//
//  Created by DohyunKim on 2021/04/22.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {
    
    let mainLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.text = "MAIN"
        mainLabel.textColor = .white
        mainLabel.font = UIFont(name: "Maplestory OTF Bold", size: 40)
        return mainLabel
    }()
    
    let homeCCTitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "홈 CCTV 보기"
        titleLabel.font = UIFont(name: "Maplestory OTF Bold", size: 25)
        titleLabel.textColor = UIColor(named: "DolbomiLabelColor")
        return titleLabel
    }()
    
    let homeCCSubtitleLabel: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.text = "반려동물이 무얼 하는지 볼 수 있어요"
        subtitleLabel.font = UIFont(name: "Maplestory OTF Light", size: 15)
        subtitleLabel.textColor = UIColor(named: "DolbomiLabelColor")
        return subtitleLabel
    }()
    
    let homeCCStackView: UIView = {
        let stackView = UIView()
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 20
        stackView.snp.makeConstraints {
            $0.height.equalTo(100)
        }
        return stackView
    }()
    
    let homeCCStackButton: UIButton = {
        let stackButton = UIButton()
        stackButton.tintColor = .clear
        stackButton.backgroundColor = .clear
        stackButton.layer.cornerRadius = 20
        stackButton.snp.makeConstraints {
            $0.height.equalTo(100)
        }
        return stackButton
    }()
    
    
    
    let autoFeedTitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "자동 배식 설정"
        titleLabel.font = UIFont(name: "Maplestory OTF Bold", size: 25)
        titleLabel.textColor = UIColor(named: "DolbomiLabelColor")
        return titleLabel
    }()
    
    let autoFeedSubTitleLabel: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.text = "반려동물이 혼자 밥을 먹게 해주세요"
        subtitleLabel.font = UIFont(name: "Maplestory OTF Light", size: 15)
        subtitleLabel.textColor = UIColor(named: "DolbomiLabelColor")
        return subtitleLabel
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
    
    let autoFeedStackButton: UIButton = {
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
        makeConst()
    }
    
    func makeUI() {
        view.backgroundColor = UIColor(named: "DolbomiMainColor")
        view.addSubview(mainLabel)
        view.addSubview(homeCCStackView)
        view.addSubview(homeCCTitleLabel)
        view.addSubview(homeCCSubtitleLabel)
        view.addSubview(homeCCStackButton)
        view.addSubview(autoFeedStackView)
        view.addSubview(autoFeedTitleLabel)
        view.addSubview(autoFeedSubTitleLabel)
        view.addSubview(autoFeedStackButton)
    }
    
    func makeConst() {
        mainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.equalToSuperview().offset(45)
        }
        
        
        homeCCStackView.snp.makeConstraints {
            $0.top.equalTo(mainLabel).offset(90)
            $0.leading.equalToSuperview().offset(40)
            $0.trailing.equalToSuperview().offset(-40)
        }
        homeCCTitleLabel.snp.makeConstraints {
            $0.top.equalTo(homeCCStackView).offset(20)
            $0.leading.equalTo(homeCCStackView).offset(30)
        }
        homeCCSubtitleLabel.snp.makeConstraints {
            $0.top.equalTo(homeCCTitleLabel).offset(40)
            $0.leading.equalTo(homeCCStackView).offset(30)
        }
        homeCCStackButton.snp.makeConstraints {
            $0.center.equalTo(homeCCStackView)
            $0.width.equalTo(homeCCStackView)
        }
        
        
        autoFeedStackView.snp.makeConstraints {
            $0.top.equalTo(homeCCSubtitleLabel).offset(90)
            $0.leading.equalToSuperview().offset(40)
            $0.trailing.equalToSuperview().offset(-40)
        }
        autoFeedTitleLabel.snp.makeConstraints {
            $0.top.equalTo(autoFeedStackView).offset(20)
            $0.leading.equalTo(autoFeedStackView).offset(30)
        }
        autoFeedSubTitleLabel.snp.makeConstraints {
            $0.top.equalTo(autoFeedTitleLabel).offset(40)
            $0.leading.equalTo(autoFeedStackView).offset(30)
        }
        autoFeedStackButton.snp.makeConstraints {
            $0.center.equalTo(autoFeedStackView)
            $0.width.equalTo(autoFeedStackView)
        }
    }
    
    
}

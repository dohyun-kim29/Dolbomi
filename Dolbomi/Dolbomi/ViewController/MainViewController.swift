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
import Then

class MainViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    let mainLabel = UILabel().then {
        $0.text = "MAIN"
        $0.textColor = .white
        $0.font = UIFont(name: "Maplestory OTF Bold", size: 40)
    }
    
    let homeCCTitleLabel = UILabel().then {
        $0.text = "홈 CCTV 보기"
        $0.font = UIFont(name: "Maplestory OTF Bold", size: 25)
        $0.textColor = UIColor(named: "DolbomiLabelColor")
    }
    
    let homeCCSubtitleLabel =  UILabel().then {
        $0.text = "반려동물이 무얼 하는지 볼 수 있어요"
        $0.font = UIFont(name: "Maplestory OTF Light", size: 15)
        $0.textColor = UIColor(named: "DolbomiLabelColor")
    }
    
    let homeCCStackView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
        $0.snp.makeConstraints {
            $0.height.equalTo(100)
        }
    }
    
    let homeCCStackButton = UIButton().then {
        $0.tintColor = .clear
        $0.backgroundColor = .clear
        $0.layer.cornerRadius = 20
        $0.snp.makeConstraints {
            $0.height.equalTo(100)
        }
    }
    
    
    
    let autoFeedTitleLabel = UILabel().then {
        $0.text = "자동 배식 설정"
        $0.font = UIFont(name: "Maplestory OTF Bold", size: 25)
        $0.textColor = UIColor(named: "DolbomiLabelColor")
    }
    
    let autoFeedSubTitleLabel = UILabel().then {
        $0.text = "반려동물이 혼자 밥을 먹게 해주세요"
        $0.font = UIFont(name: "Maplestory OTF Light", size: 15)
        $0.textColor = UIColor(named: "DolbomiLabelColor")
    }
    
    let autoFeedStackView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
        $0.snp.makeConstraints {
            $0.height.equalTo(100)
        }
    }
    
    let autoFeedStackButton = UIButton().then {
        $0.tintColor = .clear
        $0.backgroundColor = .clear
        $0.layer.cornerRadius = 20
        $0.snp.makeConstraints {
            $0.height.equalTo(100)
        }
    }
    
    
    let settingTitleLabel = UILabel().then {
        $0.text = "실시간 급여"
        $0.font = UIFont(name: "Maplestory OTF Bold", size: 25)
        $0.textColor = UIColor(named: "DolbomiLabelColor")
    }
    
    let settingSubTitleLabel = UILabel().then {
        $0.text = "실시간으로 먹이를 급여합니다"
        $0.font = UIFont(name: "Maplestory OTF Light", size: 15)
        $0.textColor = UIColor(named: "DolbomiLabelColor")
    }
    
    let settingStackView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
        $0.snp.makeConstraints {
            $0.height.equalTo(100)
        }
    }
    
    let settingStackButton = UIButton().then {
        $0.tintColor = .clear
        $0.backgroundColor = .clear
        $0.layer.cornerRadius = 20
        $0.snp.makeConstraints {
            $0.height.equalTo(100)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        makeConst()
        bind()
        
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
        
        view.addSubview(settingStackView)
        view.addSubview(settingTitleLabel)
        view.addSubview(settingSubTitleLabel)
        view.addSubview(settingStackButton)
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
        
        
        settingStackView.snp.makeConstraints {
            $0.top.equalTo(autoFeedSubTitleLabel).offset(90)
            $0.leading.equalToSuperview().offset(40)
            $0.trailing.equalToSuperview().offset(-40)
        }
        settingTitleLabel.snp.makeConstraints {
            $0.top.equalTo(settingStackView).offset(20)
            $0.leading.equalTo(settingStackView).offset(30)
        }
        settingSubTitleLabel.snp.makeConstraints {
            $0.top.equalTo(settingTitleLabel).offset(40)
            $0.leading.equalTo(settingStackView).offset(30)
        }
        settingStackButton.snp.makeConstraints {
            $0.center.equalTo(settingStackView)
            $0.width.equalTo(settingStackView)
        }
    }
    
    func bind() {
        homeCCStackButton.rx.tap
            .bind {
                self.homeCCPresenting()
            }.disposed(by: disposeBag)
        
        autoFeedStackButton.rx.tap
            .bind {
                self.AutoFeedPresenting()
            }.disposed(by: disposeBag)
        
        settingStackButton.rx.tap
            .bind {
                self.FeedingPresenting()
            }.disposed(by: disposeBag)
    }
    
    func homeCCPresenting() {
        let vc = HomeCCViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    func AutoFeedPresenting() {
        let vc = AutoFeedViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    func FeedingPresenting() {
        let vc = FeedingViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    
}

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
import Alamofire
import DLRadioButton
import Toaster

class FeedingViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    let toastMessage = Toast(text: "서버로 값이 전송되었어요", delay: Delay.short)
    
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
    
    let feedAmount0Button = DLRadioButton().then {
        $0.setTitle("소", for: .normal)
        $0.setTitleColor(UIColor(named: "DolbomiDarkColor"), for: .normal)
        $0.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        $0.snp.makeConstraints {
            $0.width.equalTo(50)
            
        }
    }
    
    let feedAmount1Button = DLRadioButton().then {
        $0.setTitle("중", for: .normal)
        $0.setTitleColor(UIColor(named: "DolbomiDarkColor"), for: .normal)
        $0.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        $0.snp.makeConstraints {
            $0.width.equalTo(50)
            
        }
    }
    
    let feedAmount2Button = DLRadioButton().then {
        $0.setTitle("대", for: .normal)
        $0.setTitleColor(UIColor(named: "DolbomiDarkColor"), for: .normal)
        $0.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        $0.snp.makeConstraints {
            $0.width.equalTo(50)
            
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
        
        view.addSubview(feedAmount0Button)
        view.addSubview(feedAmount1Button)
        view.addSubview(feedAmount2Button)

        
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
        
        feedAmount0Button.snp.makeConstraints {
            $0.top.equalTo(feedAmountTitleLabel).offset(35)
            $0.leading.equalTo(feedAmountStackView).offset(20)
        }
        feedAmount1Button.snp.makeConstraints {
            $0.top.equalTo(feedAmountTitleLabel).offset(35)
            $0.leading.equalTo(feedAmount0Button).offset(100)
        }
        feedAmount2Button.snp.makeConstraints {
            $0.top.equalTo(feedAmountTitleLabel).offset(35)
            $0.leading.equalTo(feedAmount1Button).offset(100)
        }
        
        
        confirmButton.snp.makeConstraints {
            $0.top.equalTo(feedAmountButton).offset(150)
            $0.trailing.equalToSuperview().offset(-85)
            $0.leading.equalToSuperview().offset(85)
        }
        
    }
    
    func bind() {
        
        feedAmount0Button.otherButtons.append(feedAmount1Button)
        feedAmount0Button.otherButtons.append(feedAmount2Button)
        
        backButton.rx.tap
            .bind {
                self.backDismiss()
            }.disposed(by: disposeBag)
        
        confirmButton.rx.tap
            .bind {
                self.networking()
                print("@@@@@요청이 날라갔어요@@@@@")
                self.toastMessage.show()
            }.disposed(by: disposeBag)
    }
    
    func backDismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func networking() {
        
        var amount = 0
        
        
        if feedAmount0Button.isSelected == true {
            amount = 0
        } else if feedAmount1Button.isSelected == true {
            amount = 1
        } else {
            amount = 2
        }
        
        
        AF.request("http://"+UserDefaults.standard.string(forKey: "hostUrl")!+"/feed", method: .post, parameters: ["amount":amount], encoding: JSONEncoding.default, headers: ["Content-Type":"application/json"])
                    .validate(statusCode: 200..<300)
                    .responseJSON { (response) in
                        print(response.result)
                }
    }
    
}

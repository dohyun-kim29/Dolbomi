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
import DLRadioButton
import Alamofire
import Toaster

class AutoFeedViewController: UIViewController {
    
    let disposebag = DisposeBag()
    let toastMessage = Toast(text: "서버로 값이 전송되었어요", delay: Delay.short)
    
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
    
    let autofeed4Button = DLRadioButton().then {
        $0.setTitle("4", for: .normal)
        $0.setTitleColor(UIColor(named: "DolbomiDarkColor"), for: .normal)
        $0.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        $0.snp.makeConstraints {
            $0.width.equalTo(50)
            
        }
    }
    
    let autofeed6Button = DLRadioButton().then {
        $0.setTitle("6", for: .normal)
        $0.setTitleColor(UIColor(named: "DolbomiDarkColor"), for: .normal)
        $0.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        $0.snp.makeConstraints {
            $0.width.equalTo(50)
            
        }
    }
    
    let autofeed8Button = DLRadioButton().then {
        $0.setTitle("8", for: .normal)
        $0.setTitleColor(UIColor(named: "DolbomiDarkColor"), for: .normal)
        $0.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        $0.snp.makeConstraints {
            $0.width.equalTo(50)
            
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
        
        view.addSubview(autofeed4Button)
        view.addSubview(autofeed6Button)
        view.addSubview(autofeed8Button)
        
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
        
        autofeed4Button.snp.makeConstraints {
            $0.top.equalTo(autoFeedTitleLabel).offset(35)
            $0.leading.equalTo(autoFeedStackView).offset(20)
        }
        autofeed6Button.snp.makeConstraints {
            $0.top.equalTo(autoFeedTitleLabel).offset(35)
            $0.leading.equalTo(autofeed4Button).offset(100)
        }
        autofeed8Button.snp.makeConstraints {
            $0.top.equalTo(autoFeedTitleLabel).offset(35)
            $0.leading.equalTo(autofeed6Button).offset(100)
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
        
        autofeed4Button.otherButtons.append(autofeed6Button)
        autofeed4Button.otherButtons.append(autofeed8Button)
        
        feedAmount0Button.otherButtons.append(feedAmount1Button)
        feedAmount0Button.otherButtons.append(feedAmount2Button)
        
        backButton.rx.tap
            .bind {
                self.backDismiss()
            }.disposed(by: disposebag)
        
        confirmButton.rx.tap
            .bind {
                self.networking()
                print("@@@@@요청이 날라갔어요@@@@@")
                self.toastMessage.show()
            }.disposed(by: disposebag)
    }
    
    func backDismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func networking() {
        var interval = 4
        var amount = 0
        
        if autofeed4Button.isSelected == true {
            interval = 4
        } else if autofeed6Button.isSelected == true {
            interval = 6
        } else {
            interval = 8
        }
        
        if feedAmount0Button.isSelected == true {
            amount = 0
        } else if feedAmount1Button.isSelected == true {
            amount = 1
        } else {
            amount = 2
        }
        
        
        AF.request(UserDefaults.standard.string(forKey: "hostUrl")!+"/ser_feed_info", method: .post, parameters: ["interval":"\(interval)", "amount":"\(amount)"], encoding: URLEncoding.default, headers: ["Content-Type":"application/json"])
                    .validate(statusCode: 200..<300)
                    .responseJSON { (response) in
                        print(response.result)
                }
    }
    
    
}

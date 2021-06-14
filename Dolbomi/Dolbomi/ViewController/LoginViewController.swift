//
//  LoginViewController.swift
//  Dolbomi
//
//  Created by DohyunKim on 2021/03/15.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import Then

class LoginViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    let loginLogo = UIImageView().then {
        $0.image = UIImage(named: "DolbomiLogin")
        $0.snp.makeConstraints {
            $0.width.height.equalTo(200)
        }
    }
    
    let urlTextField = UITextField().then {
        $0.layer.cornerRadius = 20
        $0.placeholder = "호스트 URL을 입력해주세요"
        $0.font = UIFont(name: "Maplestory OTF Bold", size: 17)
        $0.backgroundColor = .white
        $0.textAlignment = .center
        $0.snp.makeConstraints {
            $0.width.equalTo(200)
            $0.height.equalTo(40)
        }
        
    }
    
    let confirmButton =  UIButton().then {
        let confirmButton = UIButton()
        $0.backgroundColor = UIColor.init(named: "DolbomiDarkColor")
        $0.setTitle("다음", for: .normal)
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
        // Do any additional setup after loading the view.
        makeUI()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        makeConst()
    }
    
    func makeUI() {
        view.backgroundColor = UIColor(named: "DolbomiMainColor")
        view.addSubview(loginLogo)
        view.addSubview(urlTextField)
        view.addSubview(confirmButton)
    }
    
    func makeConst() {
        loginLogo.snp.makeConstraints {
            $0.top.equalToSuperview().offset(80)
            $0.trailing.equalToSuperview().offset(-85)
            $0.leading.equalToSuperview().offset(85)
            
        }
        urlTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(300)
            $0.trailing.equalToSuperview().offset(-85)
            $0.leading.equalToSuperview().offset(85)
        }
        confirmButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(350)
            $0.trailing.equalToSuperview().offset(-85)
            $0.leading.equalToSuperview().offset(85)
        }
        
        
        
        
    }
    
    
    
}








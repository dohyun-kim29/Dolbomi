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

class LoginViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    let loginLogo: UIImageView = {
        let loginLogo = UIImageView()
        loginLogo.image = UIImage(named: "DolbomiLogin")
        loginLogo.snp.makeConstraints { con in
            con.width.height.equalTo(200)
        }
        return loginLogo
    }()
    
    let numTextField: UITextField = {
        let numTextField = UITextField()
        numTextField.layer.cornerRadius = 20
        numTextField.placeholder = "기기번호를 입력해주세요"
        numTextField.font = UIFont(name: "Maplestory OTF Bold", size: 17)
        numTextField.backgroundColor = .white
        numTextField.textAlignment = .center
        numTextField.snp.makeConstraints {
            $0.width.equalTo(200)
            $0.height.equalTo(40)
        }
        return numTextField
    }()
    
    let confirmButton: UIButton = {
        let confirmButton = UIButton()
        confirmButton.backgroundColor = UIColor.init(named: "DolbomiDarkColor")
        confirmButton.setTitle("다음", for: .normal)
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
        view.addSubview(numTextField)
        view.addSubview(confirmButton)
    }
    
    func makeConst() {
        loginLogo.snp.makeConstraints {
            $0.top.equalToSuperview().offset(80)
            $0.trailing.equalToSuperview().offset(-85)
            $0.leading.equalToSuperview().offset(85)
            
        }
        numTextField.snp.makeConstraints {
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








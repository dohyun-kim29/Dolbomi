//
//  LoginView.swift
//  Dolbomi
//
//  Created by DohyunKim on 2021/04/06.
//

import UIKit
import SnapKit

class LoginView: UIView {
    
    private lazy var loginLogo: UIImageView = {
        let loginLogo = UIImageView()
        loginLogo.image = UIImage(named: "DolbomiLogin")
        loginLogo.snp.makeConstraints { con in
            con.width.height.equalTo(200)
        }
        return loginLogo
    }()
    
    private lazy var numTextField: UITextField = {
        let numTextField = UITextField()
        numTextField.layer.cornerRadius = 20
        numTextField.placeholder = "기기번호를 입력해주세요"
        numTextField.font = UIFont(name: "Maplestory OTF Bold", size: 17)
        numTextField.backgroundColor = .white
        numTextField.snp.makeConstraints {
            $0.width.equalTo(200)
            $0.height.equalTo(40)
        }
        return numTextField
    }()
    
    private lazy var confirmButton: UIButton = {
        let confirmButton = UIButton()
        confirmButton.backgroundColor = .brown
        confirmButton.setTitle("확인", for: .normal)
        confirmButton.setTitleColor(.white, for: .normal)
        confirmButton.titleLabel?.font = UIFont(name: "Maplestory OTF Bold", size: 17)
        confirmButton.snp.makeConstraints {
            $0.width.equalTo(200)
            $0.height.equalTo(40)
        }
        return confirmButton
    }()
    
    override func draw(_ rect: CGRect) {
        makeConst()
    }
    
    func makeConst() {
        self.addSubview(loginLogo)
        self.addSubview(numTextField)
        loginLogo.snp.makeConstraints {
            $0.top.equalToSuperview().offset(80)
            $0.trailing.equalToSuperview().offset(-85)
            $0.leading.equalToSuperview().offset(85)
        }
        numTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(300)
            $0.leading.trailing.equalTo(self.center)
        }
        confirmButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(500)
            $0.leading.trailing.equalTo(self.center)
        }
    }
}

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
    
    let stackView: UIView = {
        let stackView = UIView()
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 20
        stackView.snp.makeConstraints {
            $0.width.equalTo(300)
            $0.height.equalTo(100)
        }
        return stackView
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
        view.addSubview(stackView)
        
    }
    
    func makeConst() {
        stackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        mainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.equalToSuperview().offset(45)
        }
    }
    
    
}

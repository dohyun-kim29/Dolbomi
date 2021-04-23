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
        titleLabel.font = UIFont(name: "Maplestory OTF Bold", size: 40)
        titleLabel.textColor = UIColor(named: "DolbomiLabelColor")
        return titleLabel
    }()
    
    let homeCCSubtitleLabel: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.text = "반려동물이 무얼 하는지 볼 수 있어요"
        subtitleLabel.font = UIFont(name: "Maplestory OTF Light", size: 17)
        subtitleLabel.textColor = UIColor(named: "DolbomiLabelColor")
        return subtitleLabel
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

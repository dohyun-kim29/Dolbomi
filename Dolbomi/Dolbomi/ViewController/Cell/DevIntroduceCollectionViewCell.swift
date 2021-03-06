//
//  DevIntroduceCollectionViewCell.swift
//  Dolbomi
//
//  Created by DohyunKim on 2021/05/04.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import Then

class DevIntroduceCollectionViewCell: UICollectionViewCell {
    
    let devImageView = UIImageView().then {
        $0.snp.makeConstraints {
            $0.height.equalTo(230)
            $0.width.equalTo(230)
        }
        $0.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        $0.layer.cornerRadius = 50
    }
    
    let devName = UILabel().then {
        $0.text = "홈 CCTV"
        $0.textColor = .label
    }
    
    let devPart: UILabel = {
        let devPart = UILabel()
        devPart.text = "홈 CCTV"
        devPart.textColor = .purple
        return devPart
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
        makeConst()
        
        devImageView.layer.cornerRadius = devImageView.frame.height/2
        devImageView.layer.borderWidth = 1
        devImageView.layer.borderColor = UIColor.clear.cgColor
        // 뷰의 경계에 맞춰준다
        devImageView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeUI() {
        contentView.addSubview(devImageView)
        contentView.addSubview(devName)
        contentView.addSubview(devPart)
    }
    
    func makeConst() {
        devImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
        }
        
        devName.snp.makeConstraints {
            $0.top.equalTo(devImageView).offset(20)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
        }
        
        devPart.snp.makeConstraints {
            $0.top.equalTo(devName).offset(20)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
        }
    }
    
}

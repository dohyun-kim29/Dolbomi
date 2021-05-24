//
//  DevIntroduceViewController.swift
//  Dolbomi
//
//  Created by DohyunKim on 2021/05/04.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Then

class DevIntroduceViewController: UIViewController {
    
    let viewModel = DevIntroduceViewModel()
    let disposeBag = DisposeBag()
    
    let backButton = UIButton().then {
        $0.setImage(UIImage(named: "arrow"), for: .normal)
        $0.snp.makeConstraints {
            $0.width.equalTo(30)
            $0.height.equalTo(20)
        }
    }
    
    let titleLabel = UILabel().then {
        $0.text = "개발자 소개"
        $0.textColor = .white
        $0.font = UIFont(name: "Maplestory OTF Bold", size: 40)
    }
    
    let subtitleLabel = UILabel().then {
        $0.text = "(Team 랜선집사)"
        $0.textColor = .white
        $0.font = UIFont(name: "Maplestory OTF Bold", size: 40)
    }
    
    
    let devCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init()).then {
        $0.isPagingEnabled = true
        $0.backgroundColor = .white
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        let size:CGSize = UIScreen.main.bounds.size
        layout.itemSize = CGSize(width: size.width, height: 200)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        $0.setCollectionViewLayout(layout, animated: false)
        $0.register(DevIntroduceCollectionViewCell.self, forCellWithReuseIdentifier: "DevIntroduceCollectionViewCell")
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        uiBind()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        makeConst()
    }
    
    func makeUI() {
        view.backgroundColor = UIColor(named: "DolbomiMainColor")
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(devCollectionView)
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
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel).offset(40)
            $0.leading.equalToSuperview().offset(30)
        }
        
        devCollectionView.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel).offset(70)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.bottom.equalToSuperview().offset(-30)
        }
        
    }
    
}

extension DevIntroduceViewController {
    
    func uiBind() {
        viewModel.output.devIntroduceData.asObservable()
            .bind(to: devCollectionView.rx.items(cellIdentifier: "DevIntroduceCollectionViewCell")) {_, dev, cell in
                if let cellToUse = cell as? DevIntroduceCollectionViewCell {
                    cellToUse.devImageView.image = UIImage(named: dev.image)
                    cellToUse.devName.text = dev.name
                    cellToUse.devPart.text = dev.part
                }
            }.disposed(by: disposeBag)
    }
    
}

//
//  HomeCCViewController.swift
//  Dolbomi
//
//  Created by DohyunKim on 2021/04/26.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import WebKit
import Then

class HomeCCViewController: UIViewController {
    
    let webView = WKWebView().then {
        $0.snp.makeConstraints {
            $0.width.equalTo(300)
            $0.height.equalTo(400)
        }
    }
    
    let backButton = UIButton().then {
        $0.setImage(UIImage(named: "arrow"), for: .normal)
        $0.snp.makeConstraints {
            $0.width.equalTo(30)
            $0.height.equalTo(20)
        }
    }
    
    let titleLabel = UILabel().then {
        $0.text = "홈 CCTV"
        $0.textColor = .white
        $0.font = UIFont(name: "Maplestory OTF Bold", size: 40)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        makeConst()
    }
    
    func makeUI() {
        view.backgroundColor = UIColor(named: "DolbomiMainColor")
        view.addSubview(webView)
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        homeCCWebViewExtension()
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
        webView.snp.makeConstraints {
            $0.top.equalTo(titleLabel).offset(70)
            $0.leading.equalToSuperview().offset(40)
            $0.trailing.equalToSuperview().offset(-40)
            $0.bottom.equalToSuperview().offset(-40)
        }
    }
    
    
}

extension HomeCCViewController: WKUIDelegate, WKNavigationDelegate {
    
    func homeCCWebViewExtension() {
        webView.uiDelegate = self
        webView.navigationDelegate = self
        webView.load(URLRequest(url: URL(string: "https://op.gg")!))
    }
    
}

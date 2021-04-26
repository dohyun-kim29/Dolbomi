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

class HomeCCViewController: UIViewController {
    
    let webView: WKWebView = {
        let webView = WKWebView()
        webView.snp.makeConstraints {
            $0.width.equalTo(300)
            $0.height.equalTo(300)
        }
        return webView
    }()
    
    let backButton: UIButton = {
        let backButton = UIButton()
        backButton.setImage(UIImage(named: "arrow"), for: .normal)
        backButton.snp.makeConstraints {
            $0.width.equalTo(30)
            $0.height.equalTo(20)
        }
        return backButton
    }()
    
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
        homeCCWebViewExtension()
    }
    
    func makeConst() {
        webView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.leading.equalToSuperview().offset(30)
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

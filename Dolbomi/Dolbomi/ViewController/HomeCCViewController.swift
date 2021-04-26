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
        return webView
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
        homeCCWebViewExtension()
    }
    
    func makeConst() {
        webView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    
}

extension HomeCCViewController: WKUIDelegate, WKNavigationDelegate {
    
    func homeCCWebViewExtension() {
        webView.uiDelegate = self
        webView.navigationDelegate = self
        webView.load(URLRequest(url: URL(string: "")!))
    }
    
}

//
//  ViewController.swift
//  Dolmobi
//
//  Created by DohyunKim on 2021/03/15.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var liveCameraWebView: WKWebView!
    
    let camUrl = "http://172.20.10.13:8000"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        request()
        
    }
    
    
}

extension ViewController {
    
    
    func request() {
        
        self.liveCameraWebView.load(URLRequest(url: URL(string: camUrl)!))
        self.liveCameraWebView.navigationDelegate = self
        
    }
}


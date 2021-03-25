//
//  LoginViewController.swift
//  Dolbomi
//
//  Created by DohyunKim on 2021/03/15.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    lazy var box = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        makeUI()
    }
    
    func makeUI() {
        view.backgroundColor = UIColor(named: "DolbomiMainColor")
        view.addSubview(box)
        box.backgroundColor = .green
        box.snp.makeConstraints { con in
            con.width.height.equalTo(50)
            con.center.equalTo(self.view)
        }
    }


}


//
//  ThreeViewController.swift
//  WZTransition_Example
//
//  Created by qiuqixiang on 2021/7/22.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

class ThreeViewController: UIViewController {

    private let button = UIButton(type: .custom)
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        button.backgroundColor = UIColor.blue
        button.setTitle("隐藏", for: .normal)
        button.addTarget(self, action: #selector(SecondViewController.dis), for: .touchUpInside)
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    // 大小自定义(这边自定义不影响上面用autolayout来布局)
    override var preferredContentSize: CGSize {
        get {
            return CGSize(width: 300, height: 500)
        }
        set { super.preferredContentSize = newValue }
    }

    @objc public func dis() {
        
        self.navigationController?.pushViewController(FourViewController(), animated: true)
    }
}

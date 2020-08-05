//
//  SecondViewController.swift
//  WZTransition
//
//  Created by xiaobin liu on 2019/7/6.
//  Copyright © 2019 xiaobin liu. All rights reserved.
//

import UIKit
import WZTransition

/// MARK - SecondViewController
class SecondViewController: UIViewController {
    
    private let button = UIButton(type: .custom)
    
    public var presentAnimator: WZPresentAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "2级页面"
        view.backgroundColor = .red
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
    
    @objc public func dis() {
        
        dismiss(animated: true, completion: nil)
    }
    
    // 手势点击
    @objc public func tapGestureRecognizer() {
        dismiss(animated: true, completion: nil)
    }
    
    // 大小自定义(这边自定义不影响上面用autolayout来布局)
    override var preferredContentSize: CGSize {
        get {
            return CGSize(width: 300, height: 500)
        }
        set { super.preferredContentSize = newValue }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


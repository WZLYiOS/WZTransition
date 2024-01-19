//
//  WZNavigationViewController.swift
//  WZTransition_Example
//
//  Created by qiuqixiang on 2021/6/22.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import WZTransition

class WZNavigationViewController: UINavigationController {


    public var presentAnimator: WZPresentAnimator!
    
    override var preferredContentSize: CGSize {
        get {
            return CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        }
        set { super.preferredContentSize = newValue }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

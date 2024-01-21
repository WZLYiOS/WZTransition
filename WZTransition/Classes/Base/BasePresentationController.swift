//
//  BasePresentationController.swift
//  WZTransition
//
//  Created by xiaobin liu on 2019/7/6.
//  Copyright © 2019 xiaobin liu. All rights reserved.
//

import UIKit

/// MARK - 基类BasePresentation
public class BasePresentationController: UIPresentationController {
    
    /// 配置
    internal var config: PresentConfig!
    
    /// 初始化
    public init(presentedViewController: UIViewController, presenting
        presentingViewController: UIViewController? ,
                            config:PresentConfig) {
        self.config = config
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    
    
    /// 遮罩View
    public var maskView: UIVisualEffectView = {
        let view = UIVisualEffectView()
        return view
    }()
    
    
    /// 在呈现过渡即将开始的时候被调用的,(在这里面加入遮罩,以及遮罩显示的动画)
    public override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        
        if let c = containerView, maskView.superview == nil {
            c.insertSubview(maskView, at: 0)
        }
        
        /// 如果手势存在的话
        if let gusture = config.gestureRecognizer {
            maskView.addGestureRecognizer(gusture)
        }
        
        if self.config.isShowMask {
            
            /// 如果有毛玻璃的设置
            if let effect = config.blurEffectStyle {
                
                maskView.alpha = 1.0
                maskView.effect = UIBlurEffect(style: effect)
                
            } else if let maskViewBackgroundColor = config.maskViewBackgroundColor {
                maskView.alpha = 0.0
                maskView.backgroundColor = maskViewBackgroundColor
            } else {
                
                maskView.alpha = 0.0
                maskView.backgroundColor = UIColor.black.withAlphaComponent(0.25)
            }
        }
        
        self.presentingViewController.transitionCoordinator?.animate(alongsideTransition: { (context) in
            self.presentingViewController.view.transform = CGAffineTransform(scaleX: self.config.presentingScale, y: self.config.presentingScale)
        }, completion: nil)
    }
    
    
    /// 在退出过渡即将开始的时候被调用的,(在这里把遮罩给过渡去掉)
    public override func dismissalTransitionDidEnd(_ completed: Bool) {
        super.dismissalTransitionDidEnd(completed)
        if completed {
            UIView.animate(withDuration: config.duration) {
                self.presentingViewController.view.transform = .identity
            }
        }
    }
    
    public override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        if let c = containerView {
            maskView.frame = c.bounds
        }
    }
    
    /// 是否全屏
    public override var shouldPresentInFullscreen: Bool {
        return config.shouldPresentInFullscreen ?? true
    }
    
    /// shouldRemovePresentersView
    public override var shouldRemovePresentersView: Bool {
        return config.shouldRemovePresentersView ?? false
    }
    
    /// 视图将过渡
    public override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate(alongsideTransition: { (context) in
            // Prevent Scale error
            if let c = self.containerView {
                self.presentingViewController.view.transform = .identity
                self.presentingViewController.view.frame = c.bounds
                self.presentingViewController.view.transform = CGAffineTransform(scaleX: self.config.presentingScale, y: self.config.presentingScale)
            }
            self.presentedViewController.view.frame = self.frameOfPresentedViewInContainerView
        }) { (context) in
        }
    }
}

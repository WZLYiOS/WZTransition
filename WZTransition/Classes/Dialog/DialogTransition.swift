//
//  DialogTransition.swift
//  WZTransition
//
//  Created by xiaobin liu on 2019/7/6.
//  Copyright © 2019 xiaobin liu. All rights reserved.
//

import UIKit

/// 自定义对话框专场动画
public class DialogTransition: BasePresentTransition, UIViewControllerAnimatedTransitioning {
    
    /// 转场时间
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return config.duration
    }
    
    /// 动画
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        switch (config as! DialogConfig).animateType {
        case let .alpha(from, to):
            self.animateAlpha(from: from, to: to, context: transitionContext)
        case let .scale(x, y):
            self.animateScale(x: x, y: y, context: transitionContext)
        case let .direction(type):
            self.direction(type: type, context: transitionContext)
        }
    }
    
    
    func direction(type: DirectionType , context: UIViewControllerContextTransitioning) {
        let container = context.containerView
        if self.isPresent {
            let toVC = context.viewController(forKey: .to)!
            let finalFrame = context.finalFrame(for: toVC)
            toVC.view.frame = finalFrame
            toVC.view.transform = self.direction(type: type, frame: container.frame)
            
            container.addSubview(toVC.view)
            let presentationController = toVC.presentationController as? DialogPresentationController
            self.animate(animations: {
                toVC.view.transform = .identity
                presentationController?.maskView.alpha = 1.0
            }, completion: { (finish) in
                context.completeTransition(!context.transitionWasCancelled)
            })
            
        } else {
            let fromView = context.viewController(forKey: .from)!
            let presentationController = fromView.presentationController as? DialogPresentationController
            self.animate(animations: {
                fromView.view.transform = self.direction(type: type, frame: container.frame)
                presentationController?.maskView.alpha = 0.0
            }, completion: { (finish) in
                fromView.view.transform = .identity
                presentationController?.maskView.removeFromSuperview()
                context.completeTransition(!context.transitionWasCancelled)
            })
        }
    }
    
    fileprivate func direction(type:DirectionType,frame:CGRect) -> CGAffineTransform {
        let width = frame.width
        let height = frame.height
        switch type {
        case .left:
            return CGAffineTransform(translationX: -width, y: 0)
        case .right:
            return CGAffineTransform(translationX: width, y: 0)
        case .top:
            return CGAffineTransform(translationX: 0, y: -height)
        case .bottom:
            return CGAffineTransform(translationX: 0, y: height)
        }
    }
    
    
    func animateScale(x: CGFloat, y: CGFloat,context:UIViewControllerContextTransitioning) {
        let container = context.containerView
        if self.isPresent {
            
            let toVC = context.viewController(forKey: .to)!
            let finalFrame = context.finalFrame(for: toVC)
            toVC.view.frame = finalFrame
            toVC.view.transform = CGAffineTransform.init(scaleX: x, y: y)
            container.addSubview(toVC.view)
            let presentationController = toVC.presentationController as? DialogPresentationController
            self.animate(animations: {
                toVC.view.transform = .identity
                presentationController?.maskView.alpha = 1.0
            }, completion: { (finish) in
                context.completeTransition(!context.transitionWasCancelled)
            })
            
        } else {
            let fromView = context.viewController(forKey: .from)!
            let presentationController = fromView.presentationController as? DialogPresentationController
            self.animate(animations: {
                fromView.view.transform = CGAffineTransform.init(scaleX: x, y: y)
                presentationController?.maskView.alpha = 0.0
            }, completion: { (finish) in
                fromView.view.transform = .identity
                presentationController?.maskView.removeFromSuperview()
                context.completeTransition(!context.transitionWasCancelled)
            })
        }
        
    }
    
    
    func animateAlpha(from: CGFloat ,to: CGFloat,context: UIViewControllerContextTransitioning) {
        let container = context.containerView
        if self.isPresent {
            let toVC = context.viewController(forKey: .to)!
            let finalFrame = context.finalFrame(for: toVC)
            container.addSubview(toVC.view)
            toVC.view.frame = finalFrame
            toVC.view.alpha = from
            let presentationController = toVC.presentationController as? DialogPresentationController
            self.animate(animations: {
                toVC.view.alpha = to
                presentationController?.maskView.alpha = 1.0
            }, completion: { (finish) in
                context.completeTransition(!context.transitionWasCancelled)
            })
            
        } else {
            let fromView = context.viewController(forKey: .from)!
            let presentationController = fromView.presentationController as? DialogPresentationController
            self.animate(animations: {
                fromView.view.alpha = from
                presentationController?.maskView.alpha = 0.0
            }, completion: { (finish) in
                presentationController?.maskView.removeFromSuperview()
                context.completeTransition(!context.transitionWasCancelled)
            })
        }
    }
}


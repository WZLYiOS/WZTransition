//
//  BasePresentAnimator.swift
//  WZTransition
//
//  Created by xiaobin liu on 2019/7/6.
//  Copyright © 2019 xiaobin liu. All rights reserved.
//

import UIKit


/// MARK - WZPresentAnimator
public class WZPresentAnimator: NSObject , UIViewControllerTransitioningDelegate {
    
    public typealias T = PresentConfig
    public var config:T?
    
    unowned let base: UIViewController
    var transition: UIViewControllerAnimatedTransitioning?
    public init(_ base: UIViewController) {
        self.base = base
        super.init()
        base.modalPresentationStyle = .custom
        base.transitioningDelegate = self
    }
    
    public func dialog<T: DialogConfig>(setting: (_ config: T)->Void ) {
        config = DialogConfig()
        setting(self.config! as! T)
    }
    
    public func menu<T: MenuConfig>(setting: (_ config: T)->Void ) {
        self.config = MenuConfig()
        setting(self.config! as! T)
    }
    
    public func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if let c = config {
            switch c {
            case let c as MenuConfig:
                return c.drivenInteractive
            default:
                break
            }
        }
        return nil
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        (self.transition as? BasePresentTransition)?.isPresent = false
        return self.transition
    }
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.transition = self.transition(config: config, isPresent: true ,source: source)
        return self.transition
    }
    
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return self.presentationController(config: config, forPresented: presented, presenting: presenting)
    }
    
    fileprivate func transition(config: T? ,isPresent: Bool ,source: UIViewController?) -> UIViewControllerAnimatedTransitioning? {
        
        if let c = config {
            switch c {
            case let c as DialogConfig:
                return DialogTransition(config: c, isPresent: isPresent)
            case let c as MenuConfig:
                return MenuTransition(config: c, isPresent: isPresent)
            default: break
            }
        }
        return nil
    }
    
    fileprivate func presentationController(config:T? , forPresented presented: UIViewController, presenting: UIViewController?) -> UIPresentationController? {
        
        if let c = config {
            switch c {
            case let c as DialogConfig:
                return DialogPresentationController(presentedViewController: presented, presenting: presenting, config: c)
            case let c as MenuConfig:
                return MenuPresentationController(presentedViewController: presented, presenting: presenting, config: c)
            default: break
            }
        }
        
        return nil
    }
}


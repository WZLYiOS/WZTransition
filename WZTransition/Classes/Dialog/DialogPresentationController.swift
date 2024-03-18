//
//  DialogPresentationController.swift
//  WZTransition
//
//  Created by xiaobin liu on 2019/7/6.
//  Copyright © 2019 xiaobin liu. All rights reserved.
//

import UIKit

/// MARK - 对话框UIPresentationController
public class DialogPresentationController: BasePresentationController {
    
    
    /// dismissalTransitionWillBegin
    public override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()
        if let c = containerView, maskView.superview != c {
            c.insertSubview(maskView, at: 0)
        }
        self.presentingViewController.transitionCoordinator?.animate(alongsideTransition: { (context) in
            self.presentingViewController.view.transform = .identity
        }, completion: nil)
    }
    
    public override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
    }
    
    /// 如果你不希望被呈现的 View 占据了整个屏幕，可以调整它的frame
    public override var frameOfPresentedViewInContainerView: CGRect {
        get {
            if let frame = containerView?.frame {
                let width = frame.width
                let height = frame.height
                switch (config as! DialogConfig).dialogType {
                case .preferSize:
                    var presentedSize = self.presentedViewController.preferredContentSize
                    if presentedSize.width == 0 {
                        presentedSize = CGSize(width: width, height: height)
                    }
                    return CGRect(x: (width - presentedSize.width) / 2,
                                  y: (height - presentedSize.height) / 2,
                                  width: presentedSize.width,
                                  height: presentedSize.height)
                case .size(let s):
                    return CGRect(x: (width - s.width) / 2,
                                  y: (height - s.height) / 2,
                                  width: s.width,
                                  height: s.height)
                case .nomar:
                    return CGRect(x: 0,
                                  y: 0,
                                  width: width,
                                  height: height)
                }
            } else if let f = self.presentedView?.frame {
                return f
            }
            
            return CGRect.zero
        } set {}
    }
}

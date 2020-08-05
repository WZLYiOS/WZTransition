//
//  PresentConfig.swift
//  WZTransition
//
//  Created by xiaobin liu on 2019/7/6.
//  Copyright © 2019 xiaobin liu. All rights reserved.
//

import UIKit
import Foundation


/// MARK - 配置
public protocol Config {
    
    /// 是否遮照
    var isShowMask: Bool { get set }
    
    /// 阻尼
    var damping : CGFloat { get set }
    
    /// 初始速度
    var springVelocity : CGFloat { get set }
    
    /// 动画选项
    var animationOption: UIView.AnimationOptions { get set }
    
    /// 动画时间
    var duration : TimeInterval { get set }
    
    /// 手势
    var gestureRecognizer: UIGestureRecognizer?  { get set }
    
    /// 毛玻璃背景效果
    var blurEffectStyle: UIBlurEffect.Style? { get set }
    
    /// 背景遮罩
    var maskViewBackgroundColor: UIColor? { get set }
}


/// MARK - PresentConfig
public protocol PresentConfig: Config {
    
    var presentingScale: CGFloat  { get set }
}

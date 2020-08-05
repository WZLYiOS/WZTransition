# 我主良缘弹出框以及菜单栏组件Kit


## Requirements:
- **iOS** 9.0+
- Xcode 10.0+
- Swift 5.0+


## Installation Cocoapods
<pre><code class="ruby language-ruby">pod 'WZTransition', '~> 2.0.0'</code></pre>
<pre><code class="ruby language-ruby">pod 'WZTransition/Binary', '~> 2.0.0'</code></pre>

## Usage (Menu / Dialog)
### 1. Menu

```swift
 fileprivate func menu(row:Int) {
        
        let second = SecondViewController()
        second.presentAnimator = WZPresentAnimator(second)
        second.presentAnimator.menu { (config) in
            config.isDraggable = true
            switch row {
            case 0:
                config.presentingScale = 0.9
                config.menuType = .bottomHeight(h: 200)
            case 1:
                config.presentingScale = 1.0
                config.menuType = .bottomHeightFromViewRate(rate: 0.5)
            case 2:
                config.presentingScale = 1.0
                config.menuType = .leftWidth(w: 300)
            case 3:
                config.presentingScale = 1.0
                config.menuType = .leftWidthFromViewRate(rate: 0.5)
            case 4:
                config.presentingScale = 1.0
                config.menuType = .leftFullScreen
            case 5:
                config.presentingScale = 1.0
                config.menuType = .rightWidth(w: 300)
            case 6:
                config.presentingScale = 1.0
                config.menuType = .rightWidthFromViewRate(rate: 0.5)
            case 7:
                config.presentingScale = 0.9
                config.menuType = .rightFullScreen
            default:
                break
            }
        }
        self.present(second, animated: true, completion: nil)
    }
```

### 2. Dialog:

```swift
    class DialogViewController: UIViewController {

        public var presentAnimator: WZPresentAnimator!

        required init?(coder aDecoder: NSCoder) {
             super.init(coder: aDecoder)
             self.presentAnimator = WZPresentAnimator(self)
             self.presentAnimator.dialog { (config) in
                config.animateType = .scale(from: 0, to: 1)
                config.dialogType = .size(s: CGSize(width: 300, height: 200))
             }
        }
    }
```
## Style (Menu / Dialog)
### 1. Menu

```swift
 /// 呈现规模
    public var presentingScale: CGFloat = 1.0
    
    /// 阻尼大小
    public var damping: CGFloat = 0.0
    
    /// 动画选项
    public var animationOption: UIViewAnimationOptions = .curveLinear
    
    /// SpringVelocity则表示初始的速度，数值越大一开始移动越快。在usingSpringWithDamping为1.0f时，initialSpringVelocity分别取5.0f，15.0f和25.0f的情况。值得注意的是，初始速度取值较高而时间较短时，也会出现反弹)
    public var springVelocity: CGFloat = 0.0
    
    /// 动画时间
    public var duration: TimeInterval = 0.3
    
    /// 菜单类型
    public var menuType: MenuType = .bottomHeight(h: 100)
    
    /// 背景手势
    public var gestureRecognizer: UIGestureRecognizer?
    
    /// 背景毛玻璃效果(如果nil的话,默认一般的)
    public var blurEffectStyle: UIBlurEffectStyle?
    
    /// 是否遮照
    public var isShowMask: Bool = true
    
    /// 是否支持拖拽
    public var isDraggable = false
    
    /// 推动互动过渡
    public var drivenInteractive: UIPercentDrivenInteractiveTransition?
    
    /// 拖拽完成阀值
    public var draggableCompletedPrecent: CGFloat = 0.5
```

### 2.Dialog
```swift
    /// 呈现规模
    public var presentingScale: CGFloat = 1.0
    
    /// 阻尼大小
    public var damping: CGFloat = 0.0
    
    /// 动画选项
    public var animationOption: UIViewAnimationOptions = .curveLinear
    
    /// SpringVelocity则表示初始的速度，数值越大一开始移动越快。在usingSpringWithDamping为1.0f时，initialSpringVelocity分别取5.0f，15.0f和25.0f的情况。值得注意的是，初始速度取值较高而时间较短时，也会出现反弹)
    public var springVelocity: CGFloat = 0.0
    
    /// 动画时间
    public var duration: TimeInterval = 0.3
    
    /// 对话框类型
    public var dialogType: DialogType = DialogType.preferSize
    
    /// 动画类型
    public var animateType: DialogAnimateType = .alpha(from: 0, to: 1)
    
    /// 背景手势
    public var gestureRecognizer: UIGestureRecognizer?
    
    /// 背景毛玻璃效果(如果nil的话,默认一般的)
    public var blurEffectStyle: UIBlurEffectStyle?
    
    /// 是否遮照
    public var isShowMask: Bool = true
```

## License
WZTransition is released under an MIT license. See [LICENSE](LICENSE) for more information.

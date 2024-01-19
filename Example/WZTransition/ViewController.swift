//
//  ViewController.swift
//  WZTransition
//
//  Created by xiaobin liu on 08/15/2019.
//  Copyright (c) 2019 xiaobin liu. All rights reserved.
//

import UIKit
import WZTransition

let headerArr = ["对话框","菜单栏"]
let titleArr = [["对话框类型 : CustomSize Animate: Alpha(0 to 1)" ,
                 "Animate - Left",
                 "Animate - Right",
                 "Animate - Top",
                 "Animate - Bottom"],
                ["Menu height 200 - Bottom",
                 "Menu screen height rate 0.5 - Bottom",
                 "Menu width 200 - Left",
                 "Menu screen width 0.5 - Left",
                 "Menu full screen - Left",
                 "Menu width 200 - Right",
                 "Menu screen width 0.5 - Right",
                 "Menu full screen - Right"]]

/// MARK - Demo
final class ViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        
        let temTableView = UITableView(frame: CGRect.zero)
        temTableView.backgroundView = nil
        temTableView.backgroundColor = UIColor.clear
        temTableView.dataSource = self
        temTableView.delegate = self
        temTableView.rowHeight = 50.0
        temTableView.tableFooterView = UIView()
        temTableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        return temTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "演示"
        view.addSubview(self.tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}


// MARK: - <#UITableViewDataSource#>
extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArr[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerArr[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")!
        cell.textLabel?.text = titleArr[indexPath.section][indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}


// MARK: - <#UITableViewDelegate#>
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            self.dialogSize()
        case (0, 1):
            self.dialog(direction: .left)
        case (0, 2):
            self.dialog(direction: .right)
        case (0, 3):
            self.dialog(direction: .top)
        case (0, 4):
            self.dialog(direction: .bottom)
        default: do {
            self.menu(row: indexPath.row)
            }
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    private func dialogSize() {
        
        let second = SecondViewController()
        second.presentAnimator = WZPresentAnimator(second)
        second.presentAnimator.dialog { (config) in
            config.dialogType = .preferSize
            config.animateType = .scale(x: 1, y: 1)
            config.duration = 0.5
            config.isShowMask = true
        }
        self.present(second, animated: true, completion: nil)
    }
    
    
    private func dialog(direction: DirectionType) {
        
//        let second = SecondViewController()
//        second.presentAnimator = WZPresentAnimator(second)
//        second.presentAnimator.dialog { (config) in
//            config.dialogType = .preferSize
//            config.animateType = .direction(type: direction)
//            config.duration = 0.3
//            config.isShowMask = true
//        }
//        self.present(second, animated: true, completion: nil)
        
        let navVc = WZNavigationViewController(rootViewController: ThreeViewController())
        navVc.presentAnimator = WZPresentAnimator(navVc)
        navVc.presentAnimator.dialog { (config) in
            config.dialogType = .preferSize
            config.animateType = .direction(type: direction)
            config.duration = 0.3
            config.isShowMask = true
        }
        self.present(navVc, animated: true, completion: nil)
    }
    
    
    
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
    
}

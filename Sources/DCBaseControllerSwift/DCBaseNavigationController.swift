//
//  DCBaseNavigationController.swift
//  DCBasicKitSwift
//
//  Created by 杜才 on 2020/8/5.
//  Copyright © 2020 Zhongyuan. All rights reserved.
//

import UIKit

open class DCBaseNavigationController: UINavigationController {
    
    let configuration = DCBaseConfiguration.defaultConfiguration
    
    /// 支持是否设备自动旋转
    open override var shouldAutorotate: Bool {
        return self.topViewController?.shouldAutorotate ?? configuration.autorotate;
    }
    
    /// 支持方向
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return self.topViewController?.supportedInterfaceOrientations ?? configuration.supportedInterfaceOrientations
    }
    
    /// 状态栏样式
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return self.topViewController?.preferredStatusBarStyle ?? configuration.statusBarStyle
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()   
        // Do any additional setup after loading the view.
        navigationStyleConfiguration()
    }
    
    open override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}

extension DCBaseNavigationController {
    /// 配置 navigationBar 样式
    private func navigationStyleConfiguration() {
        self.navigationBar.isTranslucent = configuration.navigationBarTranslucent
        //self.navigationBar.barStyle = UITraitCollection.current.userInterfaceStyle == .dark ? .default : .black
        self.navigationBar.barStyle = configuration.navigationBarStyle
        self.navigationBar.tintColor = configuration.navigationTintColor
        //        if #available(iOS 13.0, *) {
        //            self.navigationBar.tintColor = UIColor.init(dynamicProvider: { (trait) -> UIColor in
        //                switch trait.userInterfaceStyle {
        //                case .dark:
        //                    return UIC
        //                default:
        //                    return .darkGray
        //                }
        //            })
        //        } else {
        self.navigationBar.barTintColor = configuration.navigationBarTintColor
        //        }
        //self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
        //self.navigationBar.setBackgroundImage(UIImage(named: "bg_navigation")?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 100, bottom: 10, right: 10)), for: .default)
        //self.navigationBar.setBackgroundImage(UIImage(named: "bg_navigation_portrait"), for: .default)
    }
}

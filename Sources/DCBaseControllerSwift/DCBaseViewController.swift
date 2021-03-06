//
//  DCBaseViewController.swift
//  DCBasicKitSwift
//
//  Created by 杜才 on 2020/8/5.
//  Copyright © 2020 Zhongyuan. All rights reserved.
//

import UIKit

open class DCBaseViewController: UIViewController, UINavigationControllerDelegate {
    
    public let configuration = DCBaseConfiguration.defaultConfiguration
    
    /// 支持设备自动旋转
    open override var shouldAutorotate: Bool {
        return configuration.autorotate
    }
    
    /// 支持竖屏显示
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return configuration.supportedInterfaceOrientations
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return  configuration.statusBarStyle
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.navigationController != nil {
            self.navigationController?.delegate = nil
        }
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.navigationController != nil {
            self.navigationController?.delegate = self as UINavigationControllerDelegate
        }
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 设置页面背景颜色
        self.view.backgroundColor = UIColor.dc_color(withHexString: COLOR_BACKGROUND)
        // 设置返回键
        setupNavigationStyles()
    }
}

public extension DCBaseViewController {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        //let navigationBarHidden: Bool = viewController.isKind(of: MineViewController.self)
        let navigationBarHidden: Bool = false
        viewController.navigationController?.setNavigationBarHidden(navigationBarHidden, animated: animated)
    }
}

extension DCBaseViewController {
    /// 设置导航栏样式
    private func setupNavigationStyles() {
        if configuration.backIndicatorImage != nil {
            // 修改返回图片
            let backBarImage = UIImage.init(named: "icon_goback")?.withRenderingMode(.alwaysOriginal)
            self.navigationController?.navigationBar.backIndicatorImage = backBarImage
            self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backBarImage
        }
        
        if self.navigationController != nil {
            // 设置返回键文字
            let backItem = UIBarButtonItem.init(title: configuration.backBarButtonItemTitle, style: .plain, target: nil, action: nil)
            self.navigationItem.backBarButtonItem = backItem
        }
    }
}

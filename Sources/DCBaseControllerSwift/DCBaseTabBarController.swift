//
//  DCBaseTabBarController.swift
//  DCBasicKitSwift
//
//  Created by 杜才 on 2020/8/5.
//  Copyright © 2020 Zhongyuan. All rights reserved.
//

import UIKit

open class DCBaseTabBarController: UITabBarController {
    
    let configuration = DCBaseConfiguration.defaultConfiguration
    
    open override var shouldAutorotate: Bool {
        return self.selectedViewController?.shouldAutorotate ?? configuration.autorotate
    }
    
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return self.selectedViewController?.supportedInterfaceOrientations ?? configuration.supportedInterfaceOrientations
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tabbarStyleConfig()
    }
    
    private func tabbarStyleConfig() {
        //self.tabBar.isTranslucent = true
        self.tabBar.barTintColor = configuration.tabbarTintColor
    }
}

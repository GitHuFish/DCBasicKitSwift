//
//  DCBaseTabBarController.swift
//  DCBasicKitSwift
//
//  Created by 杜才 on 2020/8/5.
//  Copyright © 2020 Zhongyuan. All rights reserved.
//

import UIKit

class DCBaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tabbarStyleConfig()
    }
    
    private func tabbarStyleConfig() {
        //self.tabBar.isTranslucent = true
        self.tabBar.barTintColor = .white
    }
}

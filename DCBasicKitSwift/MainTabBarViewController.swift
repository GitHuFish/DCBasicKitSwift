//
//  MainTabBarViewController.swift
//  DCBasicKitSwift
//
//  Created by 杜才 on 2020/8/8.
//  Copyright © 2020 Zhongyuan. All rights reserved.
//

import UIKit

class MainTabBarViewController: DCBaseTabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tabBarPagesInitialization()
    }
}

extension MainTabBarViewController {
    
    private var tabbarPages: NSArray {
        return [
            DCBaseNavigationController.init(rootViewController: HomeViewController.init()),
            DCBaseNavigationController.init(rootViewController: MineViewController.init()),
        ]
    }
    
    private var tabbarTitles: NSArray {
        return ["首页", "我的"]
    }
    
    private var tabbarNormalIcons: NSArray {
        return [
            UIImage(named: "icon_tabbar_home")?.withRenderingMode(.alwaysOriginal) as Any,
            UIImage(named: "icon_tabbar_mine")?.withRenderingMode(.alwaysOriginal) as Any,
        ]
    }
    
    private var tabbarSelectedIcons: NSArray {
        return [
            UIImage(named: "icon_tabbar_homeset") as Any,
            UIImage(named: "icon_tabbar_mineset") as Any,
        ]
    }
    
    private func tabBarPagesInitialization() {
        self.viewControllers = (tabbarPages as! [DCBaseNavigationController])
        tabBarItemConfiguration()
    }
    
    private func tabBarItemConfiguration() {
        var index: Int = 0
        for item in self.tabBar.items! {
            item.title = (tabbarTitles[index] as! String)
            item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)], for: .normal)
            item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.07058823529, green: 0.5882352941, blue: 0.8588235294, alpha: 1)], for: .selected)
            item.image = (tabbarNormalIcons[index] as! UIImage).withRenderingMode(.alwaysOriginal)
            item.selectedImage = (tabbarSelectedIcons[index] as! UIImage).withRenderingMode(.alwaysOriginal)
            
            index += 1
        }
    }
}

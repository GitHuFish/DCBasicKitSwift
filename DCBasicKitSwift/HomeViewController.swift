//
//  HomeViewController.swift
//  DCBasicKitSwift
//
//  Created by 杜才 on 2020/8/5.
//  Copyright © 2020 Zhongyuan. All rights reserved.
//

import UIKit

class HomeViewController: DCBaseWebController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "首页"
        
        self.load(url: "https://www.baidu.com/")
    }
}

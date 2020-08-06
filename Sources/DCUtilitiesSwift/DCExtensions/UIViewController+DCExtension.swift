//
//  UIViewController+DCExtension.swift
//  DCBasicKitSwift
//
//  Created by 杜才 on 2020/8/5.
//  Copyright © 2020 Zhongyuan. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    /// 获取导航栏高度
    func dc_navigationBarHeight() -> CGFloat {
        return self.navigationController?.navigationBar.frame.height ?? kNavigationBarHeight
    }
}

//
//  UIViewController+DCExtension.swift
//  DCBasicKitSwift
//
//  Created by 杜才 on 2020/8/5.
//  Copyright © 2020 Zhongyuan. All rights reserved.
//

import UIKit

// MARK: - UIViewController 扩展
public extension UIViewController {
    /// 导航栏高度
    /// - Returns: 高度
    func dc_navigationBarHeight() -> CGFloat {
        return self.navigationController?.navigationBar.frame.height ?? HEIGHT_NAVIGATIONBAR
    }
}

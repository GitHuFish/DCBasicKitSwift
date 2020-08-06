//
//  UINavigationController+DCExtension.swift
//  DCBasicKitSwift
//
//  Created by 杜才 on 2020/8/6.
//  Copyright © 2020 Zhongyuan. All rights reserved.
//

import UIKit

// MARK: - UINavigationController 扩展
public extension UINavigationController {
    /// 导航栏高度
    /// - Returns: 高度
    func dc_barHeight() -> CGFloat {
        return self.navigationBar.frame.size.height
    }
}

//
//  DCGeneralFunctions.swift
//  DCBasicKitSwift
//
//  Created by 杜才 on 2020/8/5.
//  Copyright © 2020 Zhongyuan. All rights reserved.
//

import UIKit

/// 导航栏高度
/// - Parameter target: 所在页面
public func dc_navigationBarHeight(target: UIViewController) -> CGFloat {
    return target.navigationController?.navigationBar.frame.size.height ?? HEIGHT_NAVIGATIONBAR
}

//
//  DCGeneralProperties.swift
//  DCBasicKitSwift
//
//  Created by 杜才 on 2020/8/5.
//  Copyright © 2020 Zhongyuan. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Constant
let kTabBarHeight: CGFloat          = 49.0;
let kNavigationBarHeight: CGFloat   = 44.0;

// MARK: - UIScreen
let SIZE_SCREEN             = UIScreen.main.bounds.size
let WIDTH_SCREEN            = UIScreen.main.bounds.width
let HEIGHT_SCREEN           = UIScreen.main.bounds.width

// MARK: - UIWindow
//let SIZE_WINDOW             = UIApplication.shared.delegate?.window!?.bounds.size
//let WIDTH_WINDOW            = UIApplication.shared.delegate?.window!?.bounds.width
//let HEIGHT_WINDOW           = UIApplication.shared.delegate?.window!?.bounds.height
let SIZE_WINDOW             = UIApplication.shared.windows.first?.bounds.size
let WIDTH_WINDOW            = UIApplication.shared.windows.first?.bounds.size.width
let HEIGHT_WINDOW           = UIApplication.shared.windows.first?.bounds.size.height

// MARK: - UIStatusBar
let HEIGHT_STATUSBAR        = UIApplication.shared.statusBarFrame.height
@available(iOS 13.0, *)
let HEIGHT_STATUSBAR_IOS13  = UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.height

// MARK: - Safe Area
//@available(iOS 11.0, *)
//let SAFEAREA_INSETS         = UIApplication.shared.keyWindow?.safeAreaInsets
//@available(iOS 11.0, *)
//let SAFEAREA_BOTTOM         = UIApplication.shared.keyWindow?.safeAreaInsets.bottom
//@available(iOS 11.0, *)
//let HEIGHT_BOTTOMBAR        = SAFEAREA_BOTTOM! + kTabBarHeight
@available(iOS 11.0, *)
let SAFEAREA_INSETS         = UIApplication.shared.windows.first?.safeAreaInsets
@available(iOS 11.0, *)
let SAFEAREA_BOTTOM         = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0.0
@available(iOS 11.0, *)
let HEIGHT_BOTTOMBAR        = SAFEAREA_BOTTOM + kTabBarHeight

// MARK: - Color
/// 常用颜色值
let COLOR_MAIN              = "#FAFAFA"
let COLOR_NAVIGATION        = "#268AE9"
let COLOR_SEPRATOR          = "#ECECEC"

/// 随机颜色 RGB
public let dc_randomColor: UIColor = {
    var rangeR: Range<CGFloat> = Range.init(uncheckedBounds: (lower: 0, upper: 1))
    let randomR: CGFloat = CGFloat.random(in: rangeR)
    var rangeG: Range<CGFloat> = Range.init(uncheckedBounds: (lower: 0, upper: 1))
    let randomG: CGFloat = CGFloat.random(in: rangeG)
    var rangeB: Range<CGFloat> = Range.init(uncheckedBounds: (lower: 0, upper: 1))
    let randomB: CGFloat = CGFloat.random(in: rangeB)
    return UIColor.init(red: randomR, green: randomG, blue: randomB, alpha: 1)
}()

//
//  DCGeneralProperties.swift
//  DCBasicKitSwift
//
//  Created by 杜才 on 2020/8/5.
//  Copyright © 2020 Zhongyuan. All rights reserved.
//

import UIKit

// MARK: - Layout
public let HEIGHT_TABBAR: CGFloat          = 49.0;
public let HEIGHT_NAVIGATIONBAR: CGFloat   = 44.0;

// MARK: UIScreen
public let dc_screenSize: CGSize = {
    return UIScreen.main.bounds.size
}()
public let dc_screenWidth: CGFloat = {
    return UIScreen.main.bounds.width
}()
public let dc_screenHeight: CGFloat = {
    return UIScreen.main.bounds.height
}()

// MARK: UIWindow
public let dc_windowSize: CGSize = {
    if #available(iOS 13.0, *) {
        return UIApplication.shared.windows.first?.bounds.size ?? .zero
    } else {
        return (UIApplication.shared.delegate?.window!?.bounds.size)!
    }
}()
public let dc_windowWidth: CGFloat = {
    if #available(iOS 13.0, *) {
        return UIApplication.shared.windows.first?.bounds.size.width ?? 0.0
    } else {
        return (UIApplication.shared.delegate?.window!?.bounds.width)!
    }
}()
public let dc_windowHeight: CGFloat = {
    if #available(iOS 13.0, *) {
        return UIApplication.shared.windows.first?.bounds.size.height ?? 0.0
    } else {
        return (UIApplication.shared.delegate?.window!?.bounds.height)!
    }
}()

// MARK: UIStatusBar
public let dc_statusBarHeight: CGFloat = {
    if #available(iOS 13.0, *) {
        return UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0
    } else {
        return UIApplication.shared.statusBarFrame.height
    }
}()

// MARK: Safe Area
public let dc_windowSafeAreaInsets: UIEdgeInsets = {
    if #available(iOS 13.0, *) {
        return UIApplication.shared.windows.first?.safeAreaInsets ?? .zero
    } else if #available(iOS 11.0, *) {
        return UIApplication.shared.keyWindow?.safeAreaInsets ?? .zero
    } else {
        return .zero
    }
}()
public let dc_bottomBarHeight: CGFloat = {
    return dc_windowSafeAreaInsets.bottom + HEIGHT_TABBAR
}()

// MARK: - Color
/// 常用颜色值
public let COLOR_MAIN               = "#FAFAFA"
public let COLOR_NAVIGATION         = "#268AE9"
public let COLOR_SEPRATOR           = "#ECECEC"

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

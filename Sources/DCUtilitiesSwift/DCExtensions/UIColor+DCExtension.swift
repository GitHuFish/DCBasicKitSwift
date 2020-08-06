//
//  UIColor+DCExtension.swift
//  DCBasicKitSwift
//
//  Created by 杜才 on 2020/8/5.
//  Copyright © 2020 Zhongyuan. All rights reserved.
//

import UIKit

// MARK: - UIColor 扩展
public extension UIColor {
    /// 随机颜色 RGB
    class var dc_randomColor: UIColor {
        get {
            let red = CGFloat(arc4random() % 256) / 255.0
            let green = CGFloat(arc4random() % 256) / 255.0
            let blue = CGFloat(arc4random() % 256) / 255.0
            return UIColor.init(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
    
    /// 随机颜色 HSB
    class var dc_randomHSBColor: UIColor {
        get {
            let hue = CGFloat(arc4random() % 256) / 255.0
            let saturation = CGFloat(arc4random() % 128) / 255.0 + 0.5
            let brightness = CGFloat(arc4random() % 128) / 255.0 + 0.5
            return UIColor.init(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
        }
    }
    
    /// 十六进制颜色值转 RGB
    /// - Parameter hex: 十六进制色值, 如 0xFFFFFF
    /// - Returns: UIColor
    class func dc_color(withHex hex: UInt) -> UIColor {
        return dc_color(withHex: hex, alpha: 1.0)
    }
    
    /// 十六进制颜色值转 RGB
    /// - Parameters:
    ///   - hex: 十六进制色值, 如 0xFFFFFF
    ///   - alpha: 透明度
    /// - Returns: UIColor
    class func dc_color(withHex hex: UInt, alpha: CGFloat) -> UIColor {
        let r = (hex >> 16) & 0xFF
        let g = (hex >> 8) & 0xFF
        let b = (hex) & 0xFF
        //let r = (hex & 0xFF0000) >> 16
        //let g = (hex & 0xFF00) >> 8
        //let b = hex & 0xFF
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
    
    class func dc_color(withHexString hex: String) -> UIColor {
        return dc_color(withHexString: hex, alpha: 1.0)
    }
    
    class func dc_color(withHexString hex: String, alpha: CGFloat) -> UIColor {
        // 去掉前后空格和换行符
        var cString = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        // strip '0X' or '#' if it appears
        if cString.hasPrefix("0X") {
        } else if cString.hasPrefix("#") {
            cString = (cString as NSString).replacingCharacters(in: (cString as NSString).range(of: "#"), with: "0x")
        } else {
            // no '0X' or '#'
            cString = "0X" + cString
        }
        // String should be 6 or 8 characters
        if cString.count != 8 {
            return .clear
        }
        // 将十六进制字符串转成整型
        let colorLong = strtoul((cString as NSString).cString(using: String.Encoding.utf8.rawValue), UnsafeMutablePointer<UnsafeMutablePointer<Int8>?>(bitPattern: 0), 16)
        // 通过位与方法获取三色值
        let R = (colorLong & 0xff0000) >> 16
        let G = (colorLong & 0x00ff00) >> 8
        let B = colorLong & 0x0000ff
        // 将 hex 转换成 color
        return UIColor(red: CGFloat(R) / 255.0, green: CGFloat(G) / 255.0, blue: CGFloat(B) / 255.0, alpha: 1.0)
    }
}

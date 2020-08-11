//
//  DCBaseConfiguration.swift
//  DCBasicKitSwift
//
//  Created by 杜才 on 2020/8/5.
//  Copyright © 2020 Zhongyuan. All rights reserved.
//

import UIKit

public class DCBaseConfiguration: NSObject {
    static let defaultConfiguration = DCBaseConfiguration()
    
    private override init() {}
    
    // MARK: - rotate
    public var autorotate: Bool = true
    public var supportedInterfaceOrientations: UIInterfaceOrientationMask = .all
    public var statusBarStyle: UIStatusBarStyle = .lightContent
    
    // MARK: - TabBar Style
    public var tabbarTintColor: UIColor = .white
    public var tabbarTintColorDark: UIColor = .white
    
    // MARK: - NavigationBar Style
    public var navigationBarTranslucent: Bool = true
    
    public var navigationBarStyle: UIBarStyle = .black
    
    public var navigationTintColor: UIColor = .white
    public var navigationTintColorDark: UIColor = .white
    
    public var navigationBarTintColor: UIColor = UIColor.dc_color(withHexString: COLOR_NAVIGATIONBAR)
    public var navigationBarTintColorDark: UIColor = UIColor.dc_color(withHexString: COLOR_NAVIGATIONBAR)
    
    public var backIndicatorImage: UIImage?
    public var backBarButtonItemTitle: String?
    //public var backIndicatorImageRenderingMode: RenderingMode = .alwaysOriginal
    
}

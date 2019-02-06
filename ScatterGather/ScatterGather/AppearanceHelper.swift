//
//  AppearanceHelper.swift
//  ScatterGather
//
//  Created by Nathanael Youngren on 2/6/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

import UIKit

enum AppearanceHelper {
    
    static func heroynFont(style: UIFont.TextStyle, pointSize: CGFloat) -> UIFont {
        let font = UIFont(name: "Heroyn Cittabhumi", size: pointSize)!
        return UIFontMetrics(forTextStyle: style).scaledFont(for: font)
    }
    
}

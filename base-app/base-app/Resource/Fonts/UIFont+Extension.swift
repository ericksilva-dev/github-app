//
//  UIFont+Extension.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 20/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

enum FontFamily {
    enum Roboto {
        static let normal = "Normal"
        static let bold = "Bold"
        static let light = "Light"
    }
}

extension UIFont {
    static func customFontDefault(familyName: String, size: CGFloat) -> UIFont {
        if let font = UIFont(name: familyName, size: size) {
            return font
        }
        return UIFont.systemFont(ofSize: size)
    }
}

extension UIFont {
    static var titleLargeLight: UIFont {
        return customFontDefault(familyName: FontFamily.Roboto.light, size: 48)
    }
    static var subTitleLargeBold: UIFont {
        return customFontDefault(familyName: FontFamily.Roboto.bold, size: 18)
    }
}

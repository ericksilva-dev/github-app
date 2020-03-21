//
//  Colors.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 20/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

public struct Colors {
    static func colorOrDefault(_ name: String, alpha: CGFloat = 1.0) -> UIColor {
        return AppAssets.colorFromName(name, alpha: alpha) ?? UIColor.black
    }
    
    public static var backgroundColorDefault: UIColor {
        return colorOrDefault("background")
    }
    
    public static var whiteColor: UIColor {
        return colorOrDefault("white")
    }
    
    public static var btnColorPrimary: UIColor {
        return colorOrDefault("btn_color_primary")
    }
    
    public static var btnColorSecundary: UIColor {
        return colorOrDefault("btn_color_secundary")
    }
}

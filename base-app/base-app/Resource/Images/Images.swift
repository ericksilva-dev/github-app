//
//  Images.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 20/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

public struct Images {
    static func imageOrDefault(_ name: String) -> UIImage {
        return AppAssets.imageFromName(name) ?? UIImage()
    }
    
    public static var appLogo: UIImage {
        return imageOrDefault("logo")
    }
    public static var iconSearch: UIImage {
        return imageOrDefault("searchIcon")
    }
}

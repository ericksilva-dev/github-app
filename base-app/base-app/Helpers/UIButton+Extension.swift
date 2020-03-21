//
//  UIButton+Extension.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 21/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

extension UIButton {
    override open func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 30
        layer.masksToBounds = true
    }
}

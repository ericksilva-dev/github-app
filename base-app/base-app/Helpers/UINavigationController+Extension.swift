//
//  UINavigationController+Extension.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 21/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

extension UINavigationController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.backgroundColor = Colors.backgroundColorDefault
        navigationBar.barTintColor = Colors.backgroundColorDefault
        navigationBar.barStyle = .black
    }
}

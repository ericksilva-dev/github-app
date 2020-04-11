//
//  Image+Extension.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 23/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

extension UIImageView{
    
    func setImage(from string: String?){
        guard let imageURLString = string else {
            self.image = UIImage(named: "user")
            return
        }
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: URL(string: imageURLString)!)
            DispatchQueue.main.async {
                self.image = data != nil ? UIImage(data: data!) : UIImage(named: "user")
            }
        }
    }
}

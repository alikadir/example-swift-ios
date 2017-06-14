//
//  UIColorExtension.swift
//  denemeSwift
//
//  Created by Ali Kadir BAGCIOGLU on 30/05/2017.
//  Copyright © 2017 Ali Kadir BAGCIOGLU. All rights reserved.
//

import UIKit;

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1) {
        let chars = Array(hex.characters)
        self.init(red: CGFloat(strtoul(String(chars[1...2]), nil, 16)) / 255,
                  green: CGFloat(strtoul(String(chars[3...4]), nil, 16)) / 255,
                  blue: CGFloat(strtoul(String(chars[5...6]), nil, 16)) / 255,
                  alpha: alpha) }
    
    
    static var random: UIColor {
        return UIColor(red: .random(), green: .random(), blue: .random(), alpha: 1.0)
    }
    
}


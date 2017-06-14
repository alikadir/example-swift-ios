//
//  CGFloatExtansion.swift
//  denemeSwift
//
//  Created by Ali Kadir BAGCIOGLU on 14/06/2017.
//  Copyright © 2017 Ali Kadir BAGCIOGLU. All rights reserved.
//

import UIKit;

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

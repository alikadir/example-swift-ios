//
//  StringExtension.swift
//  denemeSwift
//
//  Created by Ali Kadir BAGCIOGLU on 05/06/2017.
//  Copyright © 2017 Ali Kadir BAGCIOGLU. All rights reserved.
//

import UIKit

extension String
{
    func encodeUrl() -> String
    {
        return self.addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
    }
    func decodeUrl() -> String
    {
        return self.removingPercentEncoding!
    }
    
}

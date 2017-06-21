//
//  DateExtension.swift
//  denemeSwift
//
//  Created by Ali Kadir BAGCIOGLU on 21/06/2017.
//  Copyright © 2017 Ali Kadir BAGCIOGLU. All rights reserved.
//

import Foundation

extension Date
{
    func ToString(format: String) -> String
    {
        let dateFormatter = DateFormatter();
        dateFormatter.dateFormat = format;
        return dateFormatter.string(from: Date());
    }
}

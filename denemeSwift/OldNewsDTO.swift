//
//  OldNewsDTO.swift
//  denemeSwift
//
//  Created by Ali Kadir BAGCIOGLU on 31/05/2017.
//  Copyright © 2017 Ali Kadir BAGCIOGLU. All rights reserved.
//

import SwiftyJSON

class OldNewsDTO
{
    
    var title: String;
    var spot: String;
    var shareUrl: String;
    var image: String
    var date: Date;
    
    init(_ myJSON: JSON)
    {
        
        self.title = myJSON["Title"].stringValue;
        self.spot = myJSON["Spot"].stringValue;
        self.shareUrl = myJSON["ShareUrl"].stringValue;
        
        self.image = (myJSON["ImageList"].arrayValue.first?["Url"].stringValue)!;
        
        // ---- date convert ----
        let timeSpan = myJSON["NewsDate"].stringValue.replacingOccurrences(of: "/Date(", with: "").replacingOccurrences(of: ")/", with: "");
        self.date = Date(timeIntervalSince1970: (Double(timeSpan)! / 1000.0));
    }
}

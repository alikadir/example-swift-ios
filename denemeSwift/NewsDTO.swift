//
//  NewsDTO.swift
//  denemeSwift
//
//  Created by Ali Kadir BAGCIOGLU on 31/05/2017.
//  Copyright © 2017 Ali Kadir BAGCIOGLU. All rights reserved.
//

import SwiftyJSON


class NewsDTO
{
    
    var title: String;
    var spot: String;
    var shareUrl: String;
    var image: String
    var date: Date?;
    var randomColor: UIColor;
    
    init(_ myJSON: JSON)
    {
        
        self.title = myJSON["title"].stringValue;
        self.spot = myJSON["spot"].stringValue;
        self.shareUrl = myJSON["shareUrl"].stringValue;
        
        self.image = myJSON["media"]["media"].stringValue;
        
        // ---- date convert ----
        let dformat = DateFormatter();
        dformat.locale = Locale(identifier: "en_US_POSIX");
        dformat.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ";
        self.date = dformat.date(from: myJSON["newsDate"].stringValue);
        
        // ---- color convert ----
        randomColor = UIColor(hex: myJSON["randomColor"].stringValue);
    }
    
}


//
//  DownloadJsonViewController.swift
//  denemeSwift
//
//  Created by Ali Kadir BAGCIOGLU on 29/05/2017.
//  Copyright © 2017 Ali Kadir BAGCIOGLU. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON;

class DownloadJsonViewController: UIViewController
{
    override func viewDidLoad() {
        super.viewDidLoad();
        DownloadData();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    
    func DownloadData()
    {
        Alamofire.request("http://spor.api.piri.net/api/v1/Headline/GetHeadlines").responseJSON
        { response in
            if let data = response.result.value
            {
            
                let jsonData = JSON(data);
                
                for row in jsonData["headlinesB"].arrayValue
                {
                   
                    let child = News(row);
                   
                    print(child.title);
                    print(child.date);
                    print(child.shareUrl);
                    print(child.image);
                    
                    print("----------------");
                    
                }
                
            }
        }
    }
    
    class News
    {
        
        var title:String;
        var spot: String;
        var shareUrl: String;
        var image:String
        var date:Date;
        var randomColor: UIColor;
        
        init(_ myJSON:JSON)
        {
            
            self.title = myJSON["title"].stringValue;
            self.spot = myJSON["spot"].stringValue;
            self.shareUrl = myJSON["shareUrl"].stringValue;
            self.image = myJSON["media"]["media"].stringValue;
            
            // ---- date convert ----
            let dformat =  DateFormatter();
            dformat.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ";
            self.date = dformat.date(from: myJSON["newsDate"].stringValue)!;

            // ---- color convert ----
            randomColor = UIColor();
        }
        
        
        
    }
    

}



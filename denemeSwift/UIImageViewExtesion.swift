//
//  UIImageViewExtesion.swift
//  denemeSwift
//
//  Created by Ali Kadir BAGCIOGLU on 05/06/2017.
//  Copyright © 2017 Ali Kadir BAGCIOGLU. All rights reserved.
//

import UIKit;
import SDWebImage

extension UIImageView
{


    func MyImageLoader(_ MyURL: String) -> Void {
        /*
        self.af_setImage(withURL: URL(string: MyURL)!) { (response ) in
           
            print(response);
            
        }
*/
       self.sd_setImage(with: URL(string: MyURL.replacingOccurrences(of: "\u{200B}", with: ""))!);
   
        
       

    
        

}


}

//
//  XibLoad.swift
//  denemeSwift
//
//  Created by Ali Kadir BAGCIOGLU on 08/06/2017.
//  Copyright © 2017 Ali Kadir BAGCIOGLU. All rights reserved.
//

import UIKit

class XibLoadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        let CustomView = (Bundle.main.loadNibNamed("DenemeView", owner: self, options: nil)?.first as! DenemeView);
        
        
        CustomView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 250)
        
        
        self.view.addSubview(CustomView);
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

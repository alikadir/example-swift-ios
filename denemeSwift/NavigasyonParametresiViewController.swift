//
//  NavigasyonParametresiViewController.swift
//  denemeSwift
//
//  Created by Ali Kadir BAGCIOGLU on 22/05/2017.
//  Copyright © 2017 Ali Kadir BAGCIOGLU. All rights reserved.
//

import UIKit

class NavigasyonParametresiViewController: UIViewController {
    

    @IBOutlet weak var myLabel: UILabel!
  
    var GelenParametre: String?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myLabel.text = GelenParametre;
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


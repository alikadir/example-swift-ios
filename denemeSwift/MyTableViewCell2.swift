//
//  MyTableViewCell2.swift
//  denemeSwift
//
//  Created by Ali Kadir BAGCIOGLU on 05/06/2017.
//  Copyright © 2017 Ali Kadir BAGCIOGLU. All rights reserved.
//

import UIKit

class MyTableViewCell2: UITableViewCell {

    @IBOutlet weak var MyStepper: UIStepper!
    
    @IBOutlet weak var MyProgress: UIProgressView!
  
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let transform : CGAffineTransform = CGAffineTransform(scaleX: 1.0, y: 7.0)
        MyProgress.transform = transform
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func StepperValueChange(_ sender: UIStepper) {
        print(sender.value);
        MyProgress.progress = Float(sender.value / 100);
        
    }
    
}

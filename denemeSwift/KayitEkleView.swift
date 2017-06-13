//
//  KayitEkle.swift
//  denemeSwift
//
//  Created by Ali Kadir BAGCIOGLU on 13/06/2017.
//  Copyright © 2017 Ali Kadir BAGCIOGLU. All rights reserved.
//

import UIKit;

class KayitEkleView: UIView
{
    @IBOutlet weak var MyTextBox: UITextField!

    @IBAction func EkleClick() {

        SQLiteHelper.sharedInstance.addStudent(name: MyTextBox.text!);
        MyTextBox.text = "";

    }
    
    
  
    
   }

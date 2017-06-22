//
//  SayiArttirViewController.swift
//  denemeSwift
//
//  Created by Ali Kadir BAGCIOGLU on 22/05/2017.
//  Copyright © 2017 Ali Kadir BAGCIOGLU. All rights reserved.
//
import UIKit

class SayiArttirController: UIViewController {


    @IBOutlet weak var myLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myLabel.font = UIFont(name: "Frijole", size: 30);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var sayi: IntMax?;
    @IBAction func btnClick(_ sender: Any) {

        if(sayi == nil)
        {
            sayi = 5;
        }
        sayi? += 1;

        print("butona basıldı");
        myLabel.text = String(sayi!);
    }

}

//
//  AnaSayfaViewController.swift
//  denemeSwift
//
//  Created by Ali Kadir BAGCIOGLU on 22/05/2017.
//  Copyright © 2017 Ali Kadir BAGCIOGLU. All rights reserved.
//

import UIKit

class AnaSayfaViewController: UIViewController {

    @IBOutlet weak var GelenParametreTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if (segue.identifier == "ParametreliNavigasyonPush") {

            (segue.destination as! NavigasyonParametresiViewController).GelenParametre = GelenParametreTxt.text;
        }
    }
}


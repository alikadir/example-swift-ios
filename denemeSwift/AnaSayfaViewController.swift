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


    @IBAction func StatusBarChangeClick() {

        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        statusBar.backgroundColor = .random;
        
        navigationController!.navigationBar.barTintColor = .random;
        
        if (UIApplication.shared.statusBarStyle == .default) {
            UIApplication.shared.statusBarStyle = .lightContent;
        }
         else
        {
            UIApplication.shared.statusBarStyle = .default;
        }

        // plist'de "View controller-based status bar appearance" NO olmalı!!!!!
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        /*
         bu method main-storyboard üzerinde eklediğimiz navigayon bağlantıları tetiklendiğinde çalışır.
         bu bağlantıya verdiğimiz identifier'ı kontrol edip hangi bağlantının tetiklendiğini anlayabiliriz.
         */

        // print(sender); // debug modda nesne bilgisi almak için kullanılabilir.

        /****************
         INFO
         ****************
         Debug anında parametrelerin değerlerini okuyabilmek için debug consol'a "po" komutu yazarak
         nesnelerin değerlerine ulaşabiliriz.
         ****************/

        if (segue.identifier == "ParametreliNavigasyonPush") {
            (segue.destination as! NavigasyonParametresiViewController).GelenParametre = GelenParametreTxt.text;
        }
    }
    @IBAction func btnManuelPushClick() {

        let vc = storyboard?.instantiateViewController(withIdentifier: "NavigasyonParametresiVC");
        // Buradaki identifier'i main-storyboard'da viewController'ı seçip StoryboradID den ayarlıyoruz.

        (vc as! NavigasyonParametresiViewController).GelenParametre = "manuel";

        navigationController?.pushViewController(vc!, animated: true);

    }
}


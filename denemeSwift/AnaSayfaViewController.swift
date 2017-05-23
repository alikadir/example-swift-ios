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


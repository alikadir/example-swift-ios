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

    @IBOutlet weak var MyBateryStatus: UILabel!
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.


        // NotificationCenter ile uygulama içi haberleşme sağlanır.
        // bu linkde ayrıntıları var : https://stackoverflow.com/questions/24049020/nsnotificationcenter-addobserver-in-swift/35038731

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.BatteryChangeEvent),
            name: NSNotification.Name.UIDeviceBatteryLevelDidChange,
            object: nil);

        // batarya durumunu dinleyebilmek monitoring ayarını açmamız gerekir.
        UIDevice.current.isBatteryMonitoringEnabled = true;
        BatteryChangeEvent(notification: nil);

    }

    func BatteryChangeEvent(notification: NSNotification?)
    {
        MyBateryStatus.text = "%" + String(format: "%.0f", UIDevice.current.batteryLevel * 100);
    }

    @IBAction func NotificationClick() {
      
        // uygulama arka planda iken notifikasyon geliyor.
        // butona basınca 2 sn içerisinde uygulamayı arka plana at.
        
        let note = UILocalNotification();
        note.applicationIconBadgeNumber = 13;
        note.alertBody = "Deneme mesaj 123";
        note.soundName = UILocalNotificationDefaultSoundName;
        note.fireDate = Date(timeIntervalSinceNow: 2); // 2 sn sonra gönder.
        
        UIApplication.shared.scheduleLocalNotification(note);
       
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


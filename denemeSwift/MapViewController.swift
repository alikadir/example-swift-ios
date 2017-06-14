//
//  MapViewController.swift
//  denemeSwift
//
//  Created by Ali Kadir BAGCIOGLU on 14/06/2017.
//  Copyright © 2017 Ali Kadir BAGCIOGLU. All rights reserved.
//

import UIKit;
import CoreLocation;
import MapKit;

class MapViewController: UIViewController, CLLocationManagerDelegate
{

    @IBOutlet weak var MyMap: MKMapView!

    @IBOutlet weak var MyEnlem: UILabel!
    @IBOutlet weak var MyBoylam: UILabel!
    
    @IBOutlet weak var MyCounter: UILabel!
    
    

    var MySpan: Double = 50;

    @IBAction func SwitchChange(_ sender: UISwitch) {
        
        if(sender.isOn)
        {
            manager.startUpdatingLocation();
        }
        else
        {
            manager.stopUpdatingLocation();
        }
    }
    
    
    @IBAction func SegmentChangeValue(_ sender: UISegmentedControl) {

        switch sender.selectedSegmentIndex {

        case 0:
            MySpan = 50;
        case 1:
            MySpan = 5;
        case 2:
            MySpan = 0.5;
        case 3:
            MySpan = 0.05;
        case 4:
            MySpan = 0.005;
        default: break
            
        }

    }


    let manager = CLLocationManager();

    override func viewDidLoad() {
        super.viewDidLoad();

        MyCounter.text = "0";
        
        
        
        // plist'de "Privacy - Location When In Use Usage Description" eklenmeli


        manager.delegate = self;
        manager.desiredAccuracy = kCLLocationAccuracyBest // istenden doğruluk

        manager.requestWhenInUseAuthorization();
        // manager.requestLocation();
        manager.startUpdatingLocation();

    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        let loc = locations[0];

        let span = MKCoordinateSpanMake(MySpan, MySpan);
        let myLocation = CLLocationCoordinate2DMake(loc.coordinate.latitude, loc.coordinate.longitude);
        let myRegion = MKCoordinateRegionMake(myLocation, span);

        MyMap.setRegion(myRegion, animated: true);
        MyMap.showsUserLocation = true;

        MyEnlem.text = String(loc.coordinate.latitude);
        MyBoylam.text = String(loc.coordinate.longitude);
        
        
        MyCounter.text = String(Int(MyCounter.text!)! + 1);
        
    }



}

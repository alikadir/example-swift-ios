//
//  SuperMapViewController.swift
//  denemeSwift
//
//  Created by Ali Kadir BAGCIOGLU on 15/06/2017.
//  Copyright © 2017 Ali Kadir BAGCIOGLU. All rights reserved.
//

import UIKit;
import CoreLocation;
import MapKit;

class SuperMapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate
{
    @IBOutlet weak var MyMap: MKMapView!

    let manager = CLLocationManager();

    override func viewDidLoad() {
        super.viewDidLoad();

        // plist'de "Privacy - Location When In Use Usage Description" eklenmeli

        MyMap.delegate = self;
        manager.delegate = self;

        manager.desiredAccuracy = kCLLocationAccuracyBest // istenen doğruluk
        manager.requestWhenInUseAuthorization();
        manager.startUpdatingLocation();

        MyMap.showsUserLocation = true;

        //MyMap.mapType = .hybrid;

        let span = MKCoordinateSpanMake(0.01, 0.01);
        let myLocation = CLLocationCoordinate2DMake(41.0124915, 28.9036274);
        let myRegion = MKCoordinateRegionMake(myLocation, span);

        MyMap.setRegion(myRegion, animated: true);

        var annotationList = [MyAnnotation()];

        for x in 0...5
        {
            annotationList.append(MyAnnotation());
            annotationList[x].UserID = x;
        }

        annotationList[0].coordinate = CLLocationCoordinate2DMake(40.9947764, 28.8461138);
        annotationList[1].coordinate = CLLocationCoordinate2DMake(40.9960557, 28.8523457);
        annotationList[2].coordinate = CLLocationCoordinate2DMake(40.9968695, 28.855956);
        annotationList[3].coordinate = CLLocationCoordinate2DMake(40.9929624, 28.8552157);
        annotationList[4].coordinate = CLLocationCoordinate2DMake(40.9918975, 28.8491593);

        MyMap.addAnnotations(annotationList);

    }

    var annotation: MKPointAnnotation?;

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

      
        /*
        let loc = locations[0];


        let span = MKCoordinateSpanMake(0.01, 0.01);
        let myLocation = CLLocationCoordinate2DMake(loc.coordinate.latitude, loc.coordinate.longitude);
        let myRegion = MKCoordinateRegionMake(myLocation, span);

        MyMap.setRegion(myRegion, animated: true);
      

        
        
         
        if(annotation != nil) {
            MyMap.removeAnnotation(annotation!);
        }

        annotation = MKPointAnnotation();
        annotation?.coordinate = loc.coordinate;
        annotation?.title = "deneme başlık";
        annotation?.subtitle = "deneme alt başlık";


        MyMap.addAnnotation(annotation!);
        */
 


    }

    // pin içerisinde kullanıcının resmini eklemek için şu link'deki yöntem kullanılabilir.
    // https://stackoverflow.com/questions/25014576/show-user-profile-images-on-top-of-the-custom-annotation

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

        if(annotation is MKUserLocation) { // cihaz kullanıcısının lokasyonu mu?

            let id = "DeviceUSerIDsi";
            var UserAnnotationView = MyMap.dequeueReusableAnnotationView(withIdentifier: id);
            if(UserAnnotationView == nil) {
                UserAnnotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: id);

                let img = UIImage(named: "user-pin.png");
                UserAnnotationView?.image = img;
            }

            return UserAnnotationView;

        }
        else {
            
                let id = "YenidenKullanmaIDsi";
                var annotationView = MyMap.dequeueReusableAnnotationView(withIdentifier: id);
                if(annotationView == nil) {
                    annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: id);
                    let photo = "pin\((annotation as! MyAnnotation).UserID).png";
                    let img = UIImage(named: photo);
                    annotationView?.image = img;
                }

                return annotationView;
            
        }
    }

}

class MyAnnotation: MKPointAnnotation {
    var UserID: Int = 0;

    override init() {
        super.init();
    }
}





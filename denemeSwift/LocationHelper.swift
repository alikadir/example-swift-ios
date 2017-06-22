//
//  LocationHelpers.swift
//  denemeSwift
//
//  Created by Ali Kadir BAGCIOGLU on 22/06/2017.
//  Copyright © 2017 Ali Kadir BAGCIOGLU. All rights reserved.
//



import CoreLocation;
import Alamofire;


class LocationHelper: NSObject, CLLocationManagerDelegate {


    let manager = CLLocationManager();

    override init()
    {
        super.init();

        manager.delegate = self;
        manager.desiredAccuracy = kCLLocationAccuracyBest;
        manager.requestWhenInUseAuthorization();
        manager.pausesLocationUpdatesAutomatically = true;
        manager.allowsBackgroundLocationUpdates = true; // arkaplanda çalışmasını sağlyan komut
        manager.startUpdatingLocation();

    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        let loc = locations.first!;

        var request = URLRequest(url: URL(string: "http://apisimulator.pho.fm/location")!);
        request.httpMethod = "POST";
        request.setValue("application/json", forHTTPHeaderField: "Content-Type");

        let values = [String(loc.coordinate.latitude), String(loc.coordinate.longitude), loc.timestamp.datatypeValue];
        request.httpBody = try! JSONSerialization.data(withJSONObject: values);

        _ = Alamofire.request(request);


        print(loc);

    }


}

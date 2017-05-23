//
//  ResimVeDataYukleViewController.swift
//  denemeSwift
//
//  Created by Ali Kadir BAGCIOGLU on 23/05/2017.
//  Copyright © 2017 Ali Kadir BAGCIOGLU. All rights reserved.
//

import UIKit
import Alamofire

class ResimVeDataYukleViewController: UIViewController
{
    @IBOutlet weak var remoteImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        /*
        Alamofire.download("http://lorempixel.com/400/200/").responseData { response in
            switch(response.result)
            {
            case .success(let data):
                print(data);
                
            case .failure(let err):
                print("hata bu \(err)");
            }
            if let data = response.result.value {
                DispatchQueue.main.async {
                    self.remoteImageView.image = UIImage(data: data);

                }
            }
        }
 */

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

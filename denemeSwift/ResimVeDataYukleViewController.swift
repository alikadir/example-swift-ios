//
//  ResimVeDataYukleViewController.swift
//  denemeSwift
//
//  Created by Ali Kadir BAGCIOGLU on 23/05/2017.
//  Copyright © 2017 Ali Kadir BAGCIOGLU. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ResimVeDataYukleViewController: UIViewController
{

    @IBOutlet weak var localImage: UIImageView!
    @IBOutlet weak var firstRemoteImage: UIImageView!
    @IBOutlet weak var secondRemoteImage: UIImageView!
    @IBOutlet weak var thirdRemoteImage: UIImageView!

    @IBOutlet weak var imgActivityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imgLoad();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnRefresh() {

        imgLoad();
    }

    func imgLoad()
    {

        // local image'ları random seçiyoruz.
        let rndImage = arc4random_uniform(9);
        localImage.image = UIImage(named: String(rndImage) + ".jpg");
        //--------------------------------------
        
        
        imgActivityIndicator.startAnimating();

        /**************
         INFO
         ***************
         Bu bölümde documentDirectory isimli bir klasöre yükleme esnasında dosyanın temp'ini yazdırmak için kullanıyoruz.
         ***************/
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            let documentsURL = URL(fileURLWithPath: documentsPath, isDirectory: true)
            let myRandom = arc4random();
            let fileURL = documentsURL.appendingPathComponent(String(myRandom) + "image.png")
            print(fileURL);
            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
        }
        /***************/


        Alamofire.download("http://lorempixel.com/400/200/", to: destination).responseData { response in
            if let ali = response.result.value
                {
                sleep(1) // activity-indicator görünsün diye 1 saniye bekletiyoruz
                DispatchQueue.main.async {
                    self.firstRemoteImage.image = UIImage(data: ali);
                    self.imgActivityIndicator.stopAnimating();

                }
            }
        }

        Alamofire.download("http://lorempixel.com/400/200/", to: destination).responseData { response in
            switch(response.result)
            {
            case .success(let data):
                sleep(1); // activity-indicator'ün animasyonunu görebilmek için 2 sn beklettim
                DispatchQueue.main.async {
                    self.secondRemoteImage.image = UIImage(data: data);
                    self.imgActivityIndicator.stopAnimating();
                }
            case .failure(let err):
                print("hata bu \(err)");
            }
        }

        let myRandomQueryString = arc4random();

        thirdRemoteImage.af_setImage(withURL: URL(string: "http://lorempixel.com/400/200/?aa=" + String(myRandomQueryString))!);



    }


}

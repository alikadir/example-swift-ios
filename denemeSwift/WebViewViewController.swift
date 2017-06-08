//
//  WebViewViewController.swift
//  denemeSwift
//
//  Created by Ali Kadir BAGCIOGLU on 08/06/2017.
//  Copyright © 2017 Ali Kadir BAGCIOGLU. All rights reserved.
//

import UIKit;

class WebViewViewController:UIViewController
{
    @IBOutlet weak var MyWebView: UIWebView!
    
    override func viewDidLoad() {
        MyWebView.loadRequest(URLRequest(url: URL(string: "http://gzt.com")!));
        
        MyWebView.scrollView.decelerationRate = UIScrollViewDecelerationRateNormal;
    }
}

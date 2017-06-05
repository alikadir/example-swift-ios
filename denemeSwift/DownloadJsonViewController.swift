
//
//  DownloadJsonViewController.swift
//  denemeSwift
//
//  Created by Ali Kadir BAGCIOGLU on 29/05/2017.
//  Copyright © 2017 Ali Kadir BAGCIOGLU. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON;


class DownloadJsonViewController: UIViewController
{

    @IBOutlet weak var MyTableView: UITableView!

    @IBOutlet weak var MyLoadingView: UIView!

    var ds = OldNewsDataSource();

    var rc: UIRefreshControl = UIRefreshControl() ;

    override func viewDidLoad() {
        super.viewDidLoad();
        //DownloadData();
        OldDownloadData();


        /****************
        TableView Config
        *****************/
        MyTableView.register(UINib(nibName: "MyTableViewCell1", bundle: nil), forCellReuseIdentifier: "cell1");
        MyTableView.register(UINib(nibName: "MyTableViewCell2", bundle: nil), forCellReuseIdentifier: "cell2");


        if #available(iOS 10.0, *) {
            self.rc.tintColor = UIColor(hex: "#AAAB73");
            self.rc.backgroundColor = UIColor(hex: "#A5A09C");
            self.rc.attributedTitle = NSAttributedString(string: "Yenile :)", attributes: [NSForegroundColorAttributeName: UIColor(hex: "#DFD1C3")]);
            self.rc.addTarget(self, action: #selector(self.OldDownloadData), for: .valueChanged);
            self.MyTableView.addSubview(self.rc);
        }

    }

    
    func DownloadData()
    {
        Alamofire.request("http://spor.api.piri.net/api/v1/Headline/GetHeadlines").responseJSON
        { response in
            if let data = response.result.value
                {

                let jsonData = JSON(data);

                for row in jsonData["headlinesB"].arrayValue
                {

                    let child = NewsDTO(row);

                    print(child.title);
                    print(child.date!);
                    print(child.shareUrl);
                    print(child.image);
                    print(child.randomColor);
                    print("----------------");

                }

            }
        }
    }

    func OldDownloadData()
    {
        self.MyLoadingView.alpha = 1;



        Alamofire.request("http://c-xml.yenisafak.com/json/GetNewsList?id=2534448&page=0&take=200").responseJSON
        { response in
            if let data = response.result.value
                {

                let jsonData = JSON(data);

                for row in jsonData["NewsList"].arrayValue
                {

                    let child = OldNewsDTO(row);

                    self.ds.MyData.append(child);

                    print(child.title);
                    print(child.date);
                    print(child.shareUrl);
                    print(child.image);
                    print(child.spot);
                    print("----------------");

                }

                self.MyTableView.delegate = self.ds;
                self.MyTableView.dataSource = self.ds;
                self.MyTableView.reloadData();

                self.MyLoadingView.alpha = 0;
                self.rc.endRefreshing();
            }
        }
    }




}




//
//  RealmDBViewController.swift
//  denemeSwift
//
//  Created by Ali Kadir BAGCIOGLU on 09/06/2017.
//  Copyright © 2017 Ali Kadir BAGCIOGLU. All rights reserved.
//

import UIKit
import SQLite


class DBViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    @IBOutlet weak var MyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        
        
    }
    
   func insertData() ->Void
   {

    SQLiteHelper.sharedInstance.addStudent(name: "Ali Kadir BAĞCIOĞLU \(arc4random())");
    SQLiteHelper.sharedInstance.addStudent(name: "RABİA Zehra BAĞCIOĞLU \(arc4random())");
    SQLiteHelper.sharedInstance.addStudent(name: "Hilal bağcıoğlu \(arc4random())");

    MyTableView.reloadData();
    
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SQLiteHelper.sharedInstance.getStudentCount();
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell1")!;
        
        let row = SQLiteHelper.sharedInstance.getById(id: indexPath.row+1);
        cell.textLabel?.text = row?.get(SQLiteHelper.sharedInstance.Name);
        
        return cell;
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       
        let actualPosition = scrollView.contentOffset.y;
        let contentHeight = scrollView.contentSize.height - (MyTableView.frame.size.height);
        if (actualPosition >= contentHeight) {
            
            insertData();
            print("loading data");
            sleep(2);
            print("loaded");
        }
    }

}




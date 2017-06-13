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

        self.MyTableView.tableHeaderView = (Bundle.main.loadNibNamed("KayitEkleView", owner: self, options: nil)?.first as! UIView);
        
        
        MyTableView.setContentOffset(CGPoint.init(x: 0, y: 40), animated: false);
        
        
        DispatchQueue.main.async {
            self.MyTableView.tableHeaderView?.frame.size.height = 45;
            self.MyTableView.reloadData();
        }
 
       
    }
    
  
    
/*
    override func viewDidAppear(_ animated: Bool) {
        
        self.MyTableView.tableHeaderView?.frame.size.height = 45;
    }
 */

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SQLiteHelper.sharedInstance.getStudentCount();
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell1")!;

        let row = SQLiteHelper.sharedInstance.getById(id: indexPath.row + 1);
        cell.textLabel?.text = row?.get(SQLiteHelper.sharedInstance.Name);
        cell.detailTextLabel?.text = String(arc4random());

        return cell;
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
/*
        let actualPosition = scrollView.contentOffset.y;
        let contentHeight = scrollView.contentSize.height - (MyTableView.frame.size.height);
        if (actualPosition >= contentHeight) {

            MyTableView.reloadData();
            sleep(2000);
        }
 */
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
      
        let actualPosition = scrollView.contentOffset.y;
        let contentHeight = scrollView.contentSize.height - (MyTableView.frame.size.height);
        if (actualPosition >= contentHeight) {
       
            MyTableView.reloadData();
            print("tableview refresh");
            
        }
        
    }
    

}




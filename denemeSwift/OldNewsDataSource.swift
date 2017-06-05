//
//  OldNewsDataSource.swift
//  denemeSwift
//
//  Created by Ali Kadir BAGCIOGLU on 02/06/2017.
//  Copyright © 2017 Ali Kadir BAGCIOGLU. All rights reserved.
//

import UIKit

class OldNewsDataSource: NSObject, UITableViewDataSource, UITableViewDelegate
{

    var MyData: [OldNewsDTO] = [];
    //var tv:UITableView?;

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if(indexPath.row == 4)
        {

            let cell = (tableView.dequeueReusableCell(withIdentifier: "cell2") as! MyTableViewCell2);
            return cell;

        }
            else
        {

            let row = MyData[indexPath.row];
            let cell = (tableView.dequeueReusableCell(withIdentifier: "cell1") as! MyTableViewCell1);
            cell.MyImageUrl = row.image;
            cell.MyText = row.spot;
            cell.LoadData();
            return cell;
        }

    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //tv = tableView;
        return MyData.count;
    }

    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index;
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return indexPath.row == 4 ? 100 : 270;
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        
       
        if(scrollView.contentOffset.y < -100)
        {
            if (scrollView is UITableView)
            {
                
                let tv = (scrollView as! UITableView);
                let rc = (tv.subviews.first(where: {$0 is UIRefreshControl}) as! UIRefreshControl)
                rc.attributedTitle = NSAttributedString(string: "şimdi goool!", attributes: [NSForegroundColorAttributeName: UIColor(hex: "#DFD1C3")]);
                rc.backgroundColor = UIColor(hex: "#A5A09C");
               
                
            }
            
        }
    }

}

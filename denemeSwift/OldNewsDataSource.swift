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


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        print("cell for row at index path");

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
        return MyData.count;
    }

    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index;
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return indexPath.row == 4 ? 100 : 270;
    }


}

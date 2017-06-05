//
//  MyTableViewCell1TableViewCell.swift
//  denemeSwift
//
//  Created by Ali Kadir BAGCIOGLU on 01/06/2017.
//  Copyright © 2017 Ali Kadir BAGCIOGLU. All rights reserved.
//

import UIKit;
import AlamofireImage;

class MyTableViewCell1: UITableViewCell {

    var MyImageUrl: String = "";
    var MyText: String = "";

   // @IBOutlet weak var MyImage: UIImageView!
    @IBOutlet weak var MyLabel: UILabel!
    @IBOutlet weak var MyImage: UIImageView!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        print("xib1 awake");

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }




    func LoadData() -> Void
    {
        MyImage.MyImageLoader(MyImageUrl);
       // MyImage.af_setImage(withURL: URL(string: MyImageUrl)!);
       // print("set IMAGE: "+MyImageUrl);
        MyLabel.text = MyText;
    }

}

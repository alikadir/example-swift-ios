//
//  DenemeView.swift
//  denemeSwift
//
//  Created by Ali Kadir BAGCIOGLU on 08/06/2017.
//  Copyright © 2017 Ali Kadir BAGCIOGLU. All rights reserved.
//

import UIKit

class DenemeView: UIView {


    @IBOutlet weak var MyProgress: UIProgressView!
    @IBOutlet weak var MyLabel: UILabel!

    override func didAddSubview(_ subview: UIView) {

        print("view add sub view");

        let _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            
            if (self.MyProgress.progress >= 1) {
                timer.invalidate();
            }
            
            self.MyProgress.setProgress(self.MyProgress.progress + 0.001, animated: true);
            self.MyLabel.text = String(format: "%.0f", self.MyProgress.progress * 100) + " %";
            
        }

    }
}

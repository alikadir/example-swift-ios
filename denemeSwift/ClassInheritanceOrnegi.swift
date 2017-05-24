//
//  DenemeClass.swift
//  denemeSwift
//
//  Created by Ali Kadir BAGCIOGLU on 22/05/2017.
//  Copyright © 2017 Ali Kadir BAGCIOGLU. All rights reserved.
//

import Foundation

class Araba
{
    let tekerlek: Int8 = 4; // let ile tanımlananlar constant oluyor sonradan değiştirilemiyor.
    var hiz: Int = 0;
    var durum: String
    {
        if hiz < 50 {
            return "yavaş";
        }
        else if (hiz < 50) && ( hiz < 100) {
            return "normal";
        }
        else {
            return "hızlı";
        }
    }
}







class AkilliAraba: Araba
{
    override var hiz: Int {
        didSet // değişkene bir data atıldığında tetikleniyor. getter & setter ;)
        {
            if( hiz > 90) {
                print("aşırı hız");
                hiz = 90;
                print("hız düşürüldü.");
            }
        }
    }
}



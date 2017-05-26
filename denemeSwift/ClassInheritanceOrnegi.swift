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
    var tip: arabaTipiEnum = .DortXDort;
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

    var ad: String {
        get {
            return "örnek ad";
        }
        set(dd) {
            print(dd);
        }

    }

    enum arabaTipiEnum {
        case DortXDort
        case Jip
        case Sedan
    }

    func git1(_ hiz: Int, _ tip: arabaTipiEnum) -> Bool
    {
        self.hiz = hiz;
        self.tip = tip;

        return true;
    }

    func git2(hiz: Int, tip: arabaTipiEnum) -> Bool
    {
        self.hiz = hiz;
        self.tip = tip;

        return true;
    }

    // git1(30, .DortXDort);
    // git2(hiz: 30, tip: .DortXDort);
}


class AkilliAraba: Araba
{
    override var hiz: Int {
        didSet // değişkene bir data atıldıktan sonra tetikleniyor.
        {
            if( hiz > 90) {
                print("aşırı hız");
                hiz = 90;
                print("hız düşürüldü.");
            }
        }
        willSet { // değişkene bir data atılmadan önce tetikleniyor.
            print("değişken atanmadan önce çalışır.")
        }

    }
}



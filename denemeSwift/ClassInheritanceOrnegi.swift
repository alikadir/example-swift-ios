//
//  DenemeClass.swift
//  denemeSwift
//
//  Created by Ali Kadir BAGCIOGLU on 22/05/2017.
//  Copyright © 2017 Ali Kadir BAGCIOGLU. All rights reserved.
//

import Foundation


protocol IArac {
    var hiz: Int { get set };
    func deneme1(sayi1: Int) -> Int;

}

class Araba: IArac
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

    func git3(myHiz hiz: Int, myTip tip: arabaTipiEnum) -> Bool
    {
        self.hiz = hiz;
        self.tip = tip;

        return true;
    }

    func git4(hiz: inout Int) -> Void {
        hiz = 50;
        /* 
         "inout" komutu C# daki ref/out gibi fonksiyona gönderdiğimiz parametre fonksiyon içerisinde değiştirildiğinde
         fonksiyonun çağırıldığı yerdeki değişkenin değeri de değişir.
         */
    }

    // git1(30, .DortXDort);
    // git2(hiz: 30, tip: .DortXDort);
    // git3(myHiz: 30, myTip: .DortXDort);
    // var myHiz = 30; git4(hiz: &myHiz);

    func deneme1(sayi1: Int) -> Int {

        let _ = git1(2, .DortXDort); // fonksiyonun dönen değerine ihtiyacımız olmadığı durumlarda _ kullanırız.

        let _ = deneme2({ (a: Int, b: Int) -> Int in
            return a + b;
        });
        return 0;
    }

    func deneme2(_ uzakFunc: (Int, Int) -> Int) -> Int
    {
        return uzakFunc(3, 5);
    }

    /* function tanımlamanın farklı bir hali "in" kullanarak ör; https://stackoverflow.com/a/30379166 bu yöntemin adı "Closure Expression"
   
    deneme2({ (a: Int, b: Int) -> Int in
        return a + b;
    });
     
    */

    @discardableResult
    func deneme3(_ sayi1: Int, _ sayi2: Int) -> Int
    {
        return sayi1 * sayi2;
    }
    
    /*
     @discardableResult
     normalde fonksiyon bir değer döndürüyorsa mutlaka onu kod içerisinde yakalamamız lazım yoksa uyarı alırız.
     let _ = deneme3(47, 3);
     eğer bunu engellemek istiyorsak fonksiyonu tanımladığımız yerin başına @discardableResult yazmalıyız.
     deneme3(47, 3);
     */

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



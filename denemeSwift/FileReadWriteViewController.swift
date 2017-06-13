//
//  FileReadWriteViewController.swift
//  denemeSwift
//
//  Created by Ali Kadir BAGCIOGLU on 13/06/2017.
//  Copyright © 2017 Ali Kadir BAGCIOGLU. All rights reserved.
//

import UIKit

class FileReadWriteViewController: UIViewController
{
    @IBOutlet weak var MyTextView: UITextView!
    @IBOutlet weak var MyTextBox: UITextField!
    @IBOutlet weak var MyButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad();

        ReadFile();

        print(filePathUrl);
        
    }

    let filePathUrl = FileManager.default.urls(for:.documentDirectory, in: .userDomainMask).first?.appendingPathComponent("AKB_file.txt");

    func ReadFile()
    {
        let content: String;

        do {
            content = try String(contentsOf: filePathUrl!, encoding: String.Encoding.utf8)
        } catch _ {
            content = ""
        }

        MyTextView.text = content;
    }

    func WriteFile()
    {
        let content = (MyTextBox.text! + "\n").data(using: .utf8);

        
        if FileManager.default.fileExists(atPath: filePathUrl!.path) { // dosya varmı yok mu kontrolü yapıp varsa içine ekleme yoksa direk yazma yapıyoruz.
            
        
            if let fileHandle = try? FileHandle(forUpdating: filePathUrl!) {
                
                fileHandle.seekToEndOfFile();
                fileHandle.write(content!);
                fileHandle.closeFile();
                
            }
            
        }
        else {
            try! content?.write(to: filePathUrl!);
            
        }
        
    }
    @IBAction func MyButtonClick() {

        WriteFile();
        ReadFile();

    }

}

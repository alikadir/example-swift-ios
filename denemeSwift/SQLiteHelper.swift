//
//  RealmDBHelper.swift
//  denemeSwift
//
//  Created by Ali Kadir BAGCIOGLU on 09/06/2017.
//  Copyright © 2017 Ali Kadir BAGCIOGLU. All rights reserved.
//

import Foundation
import SQLite

class SQLiteHelper {
    static var sharedInstance = SQLiteHelper()
    var db: Connection?
    
    let Student = Table("Student")
    let Id = Expression<Int64>("Id")
    let Name = Expression<String>("Name")
    
    
    init() {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        print(path)
        do{
            db = try Connection("\(path)/school.sqlite3")
            /*
             try db!.run(Student.create(block: {
             t in
             t.column(Id)
             t.column(Name)
             }))
             */
            
            try db!.run(Student.create(temporary: false, ifNotExists: true, block: {
                t in
                t.column(Id,primaryKey:true)
                t.column(Name)
            }))
        }
        catch{
            print("HATA \(error)")
        }
    }
    
    func getStudentCount() -> Int
    {
        return (try? db!.scalar(Student.count))!;        
    }
    
    
    func addStudent(name:String){
        do{
            try db!.run(Student.insert(Name<-name))
        }
        catch{
            
        }
    }
    
    func getById(id:Int64) -> Row? {
        do{
            let query = Student.filter(Id == id)
            let data = try db!.pluck(query)
            return data
            
        }
        catch{
            print("Get by Id Error : \(error)")
            return nil
        }
    }
    
    
    func deleteById(id:Int64){
        do{
            let student = Student.filter(Id == id)
            try db!.run(student.delete())
        }
        catch{
            print("Get by Id Error : \(error)")
            
        }
    }
    
}

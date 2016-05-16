//
//  ViewController.swift
//  SugarRecordForRealm
//
//  Created by xiaolei on 16/5/16.
//  Copyright © 2016年 xiaolei. All rights reserved.
//

import UIKit
import SugarRecord

class ViewController: UIViewController {

    //初始化一个 Storage
    lazy var db: RealmDefaultStorage = {
        
        return RealmDefaultStorage()
    }()
    
    override func viewDidLoad() {
        
        print(NSHomeDirectory())
        
        super.viewDidLoad()
        
        
        do {
            try db.operation { (context, save) in
                
                let dog: Dog = try context.new()
                dog.name = "redd"
                dog.age = 9
                try context.insert(dog)
                save()
            }
        }catch {
            print("insert error")
        }
        
        let blackDog: Dog = Dog()
        blackDog.age = 90
        blackDog.name = "black"
        
        do {
            try db.operation({ (context, save) in
                try context.insert(blackDog)
                save()
            })
            
        }catch {

        }
        
        /*
         Terminating app due to uncaught exception 'RLMException', reason: 'Primary key can't be changed after an object is inserted.'
         */
        
//        do {
//            try db.operation({ (context, save) in
//                let dog: Dog = try context.create()
//                dog.name = "green"
//                dog.age = 9
//                save()
//            })
//        }catch {
//            
//        }
        
        let dogs: [Dog] = try! db.fetch(Request<Dog>())
        dogs.forEach { (dog) in
            print(dog.name, dog.age)
        }

    }



}


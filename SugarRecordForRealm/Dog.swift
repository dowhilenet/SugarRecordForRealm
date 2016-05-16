//
//  Dog.swift
//  SugarRecordForRealm
//
//  Created by xiaolei on 16/5/16.
//  Copyright © 2016年 xiaolei. All rights reserved.
//

import Foundation
import RealmSwift

class Dog: Object {
    
    dynamic var name: String = ""
    dynamic var age: Int = 0
    
    override class func primaryKey() -> String? {
        
        return "name"
    }
}

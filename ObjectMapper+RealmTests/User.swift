//
//  User.swift
//  ObjectMapper+Realm
//
//  Created by Jake Peterson on 9/13/17.
//  Copyright 2017 Jake Peterson. All rights reserved.
//

import ObjectMapper
import RealmSwift
import ObjectMapper_Realm

class User: Object, Mappable {
    dynamic var username: NSString?
    var friends: List<User>?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override class func primaryKey() -> String? {
        return "username"
    }
    
    func mapping(map: Map) {
        username              <- map["username"]
        friends               <- (map["friends"], ListTransform<User>())
    }
}

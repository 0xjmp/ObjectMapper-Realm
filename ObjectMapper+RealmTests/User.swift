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

class Storage {
    static let shared = Storage()
    
    var realm: Realm {
        get {
            let config = Realm.Configuration(inMemoryIdentifier: "test")
            return try! Realm.init(configuration: config)
        }
    }
}

class User: Object, Mappable {
    @objc dynamic var username: NSString = ""
    var friends: List<User>?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override class func primaryKey() -> String? {
        return "username"
    }
    
    func mapping(map: Map) {
        username              <- map["username"]
        friends               <- (map["friends"], ListTransform<User>(onSerialize: onSerialize))
    }
    
    private func onSerialize(users: List<User>) {
        let realm = Storage.shared.realm
        try! realm.write {
            realm.add(users, update: .modified)
        }
    }
}

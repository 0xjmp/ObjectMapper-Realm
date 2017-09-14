//
//  ListTransformTests.swift
//  ObjectMapper+Realm
//
//  Created by Jake Peterson on 9/13/17.
//  Copyright © 2017 Jake Peterson. All rights reserved.
//

import XCTest
import ObjectMapper

class ListTransformTests: XCTestCase {
    
    let mapper = Mapper<User>()
    
    var userJson: [String: Any] {
        get {
            return ["username": "0", "friends": friends]
        }
    }
    
    var friends: [[String: String]] {
        get {
            return [
                ["username": "1"],
                ["username": "2"]
            ]
        }
    }
    
    func testSerializeFromJsonFailure() {
        var userJsonFakeFriends = userJson
        userJsonFakeFriends["friends"] = ["not": "valid"]
        let user = mapper.map(JSONObject: userJsonFakeFriends)
        XCTAssertNotNil(user, "should serialize user")
        XCTAssertNil(user!.friends)
    }
    
    func testSerializeFromJson() {
        let user = mapper.map(JSONObject: userJson)
        XCTAssertNotNil(user, "should serialize user")
        XCTAssertEqual(user!.friends!.count, friends.count)
    }
    
    func testSerializeToJson() {
        let user = mapper.map(JSONObject: userJson)
        XCTAssertNotNil(user, "should serialize user")
        let json = mapper.toJSON(user!)
        XCTAssertNotNil(json["friends"], "should deserialize friends")
    }
    
}

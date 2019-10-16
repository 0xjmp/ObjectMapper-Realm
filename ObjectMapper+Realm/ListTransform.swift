//
//  ListTransform.swift
//  ObjectMapper+Realm
//
//  Created by Jake Peterson on 8/25/16.
//  Copyright © 2016 jakenberg. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

struct ListTransform<T: RealmSwift.Object>: TransformType where T: BaseMappable {
    
    init() { }
    
    typealias Object = List<T>
    typealias JSON = Array<Any>
    
    func transformFromJSON(_ value: Any?) -> List<T>? {
        if let objects = Mapper<T>().mapArray(JSONObject: value) {
            let list = List<T>()
            list.append(objectsIn: objects)
            return list
        }
        return nil
    }
    
    func transformToJSON(_ value: Object?) -> JSON? {
        return value?.compactMap { $0.toJSON() }
    }
    
}

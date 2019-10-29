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
    
    typealias Serialize = (List<T>) -> ()
    private let onSerialize: Serialize
    
    init(onSerialize: @escaping Serialize = { _ in }) {
        self.onSerialize = onSerialize
    }
    
    typealias Object = List<T>
    typealias JSON = Array<Any>
    
    func transformFromJSON(_ value: Any?) -> List<T>? {
        let list = List<T>()
        if let objects = Mapper<T>().mapArray(JSONObject: value) {
            list.append(objectsIn: objects)
        }
        self.onSerialize(list)
        return list
    }
    
    func transformToJSON(_ value: Object?) -> JSON? {
        return value?.compactMap { $0.toJSON() }
    }
    
}

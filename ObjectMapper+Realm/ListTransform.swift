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

public struct ListTransform<T: RealmSwift.Object where T: Mappable>: TransformType {
    
    public init() { }
    
    public typealias Object = List<T>
    public typealias JSON = Array<AnyObject>
    
    public func transformFromJSON(value: AnyObject?) -> List<T>? {
        if let objects = Mapper<T>().mapArray(value as? [AnyObject]) {
            let list = List<T>()
            list.appendContentsOf(objects)
            return list
        }
        return nil
    }
    
    public func transformToJSON(value: Object?) -> JSON? {
        return value?.flatMap { $0.toJSON() }
    }
    
}

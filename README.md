# ObjectMapper+Realm

[![Version](https://img.shields.io/cocoapods/v/ObjectMapper+Realm.svg?style=flat)](http://cocoapods.org/pods/ObjectMapper+Realm)
[![License](https://img.shields.io/cocoapods/l/ObjectMapper+Realm.svg?style=flat)](http://cocoapods.org/pods/ObjectMapper+Realm)
[![Platform](https://img.shields.io/cocoapods/p/ObjectMapper+Realm.svg?style=flat)](http://cocoapods.org/pods/ObjectMapper+Realm)

## Installation

ObjectMapper+Realm is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ObjectMapper+Realm"
```

## Usage

To use `ListTransform` just add it to the mapping of your RealmObject:
```swift
import ObjectMapper
import RealmSwift
import ObjectMapper_Realm

class User: Object, Mappable {
  var username: NSString?
  var friends: List<User>?

  required convenience init?(_ map: Map) {
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
```
Have fun! 🎬

## Author

[Jake Peterson](http://jakenberg.io)

## License

ObjectMapper+Realm is available under the MIT license. See the LICENSE file for more info.

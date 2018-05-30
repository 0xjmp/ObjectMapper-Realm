platform :ios, '8.0'

use_frameworks!

def shared_pods
  pod 'RealmSwift', '~> 2.10.0'
  pod 'ObjectMapper', '~> 2.2.8'
end

target 'ObjectMapper_Realm' do
  shared_pods
end

target 'ObjectMapper_RealmTests' do
  shared_pods
end

target 'ObjectMapper_Realm_Watch_Extension' do
  platform :watchos, '4.1'
  shared_pods
end

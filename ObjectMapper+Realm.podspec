Pod::Spec.new do |s|
  s.name             = 'ObjectMapper+Realm'
  s.version          = '0.1'
  s.summary          = "A Realm extension that serializes arbitrary JSON into Realm's List class"

  s.homepage         = 'https://github.com/jakenberg/ObjectMapper-Realm'
  s.license          = "MIT"
  s.author           = { 'Jake Peterson' => 'hello@jakenberg.io' }
  s.source           = { :git => 'https://github.com/jakenberg/ObjectMapper-Realm.git', :tag => s.version.to_s }

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"

  s.requires_arc = "true"

  s.dependency "ObjectMapper"
  s.dependency "RealmSwift"
  
  s.pod_target_xcconfig = {
    'SWIFT_VERSION' => '3.0',
  }
  s.source_files = "ObjectMapper+Realm/*.swift"
end

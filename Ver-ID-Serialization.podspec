Pod::Spec.new do |spec|

  spec.name         = "Ver-ID-Serialization"
  spec.module_name  = "VerIDSerialization"
  spec.version      = "1.0.0"
  spec.summary      = "Serialization of common Ver-ID SDK types using protocol buffers"
  spec.homepage     = "https://github.com/AppliedRecognition/Ver-ID-Serialization-Apple"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = "Jakub Dolejs"
  spec.platform     = :ios, "11.0"
  spec.source       = { :git => "https://github.com/AppliedRecognition/Ver-ID-Serialization-Apple.git", :tag => "v#{spec.version}" }
  spec.dependency   "Ver-ID/Core", "~> 2.6"
  spec.dependency   "SwiftProtobuf", "~> 1.19"
end

# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

abstract_target 'Serialization' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'Ver-ID/Core', :git => 'https://github.com/AppliedRecognition/Ver-ID-UI-iOS.git', :commit => 'eaed7559b5bf468d9af529357d52a3d3a87ebd45'
  pod 'SwiftProtobuf', '~> 1.19'
  
  target 'VerIDSerialization' do
  
  end

  target 'VerIDSerializationTests' do
    # Pods for testing
  end

  post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
      config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
      config.build_settings['ENABLE_BITCODE'] = 'YES'
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
      if config.name == 'Release'
        config.build_settings['BITCODE_GENERATION_MODE'] = 'bitcode'
        config.build_settings['OTHER_CFLAGS'] = '$(inherited) -faligned-allocation -fembed-bitcode'
        config.build_settings['OTHER_LDFLAGS'] = '$(inherited) -faligned-allocation -fembed-bitcode'
      else
        config.build_settings['BITCODE_GENERATION_MODE'] = 'marker'
        config.build_settings['OTHER_CFLAGS'] = '$(inherited) -faligned-allocation -fembed-bitcode-marker'
        config.build_settings['OTHER_LDFLAGS'] = '$(inherited) -faligned-allocation -fembed-bitcode-marker'
      end
    end
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings.delete 'BUILD_LIBRARY_FOR_DISTRIBUTION'
        config.build_settings.delete 'ENABLE_BITCODE'
        config.build_settings.delete 'BITCODE_GENERATION_MODE'
        config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
      end
    end
  end
end

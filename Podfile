# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'TechCrunchNews' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for TechCrunchNews
  pod 'SwiftyJSON', '~> 4.0'
  pod 'Kingfisher', '~> 4.3'
  pod 'SBTUITestTunnelServer'

  #  UnitTests
  target 'TechCrunchNewsTests' do
    inherit! :search_paths
    # Pods for testing
  pod 'SwiftyJSON', '~> 4.0'
  end

  #  UITests
  target 'TechCrunchNewsUITests' do
    pod 'XCTest-Gherkin'
    pod 'SBTUITestTunnelClient'
  end
  
end





post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            if config.name == 'Debug' # the name of your build configuration
              config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] = ['$(inherited)', 'ENABLE_UITUNNEL=1', 'ENABLE_UITUNNEL_SWIZZLING=1']
              config.build_settings['SWIFT_ACTIVE_COMPILATION_CONDITIONS'] = ['$(inherited)', 'ENABLE_UITUNNEL', 'ENABLE_UITUNNEL_SWIZZLING']
            end
        end
    end
end

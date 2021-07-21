# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'TechCrunchNews' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for TechCrunchNews
  pod 'SwiftyJSON', '~> 4.0'
  pod 'Kingfisher', '~> 4.3'

  flutter_application_path = './my_flutter'
  load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')
  install_all_flutter_pods(flutter_application_path)

  target 'TechCrunchNewsTests' do
    inherit! :search_paths
    # Pods for testing
  pod 'SwiftyJSON', '~> 4.0'

  end

end

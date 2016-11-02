# Uncomment this line to define a global platform for your project
platform :ios, '10.0'
source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!

target 'My TicTacToe' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks

  # Pods for My TicTacToe
  pod 'SnapKit', '~> 3.0'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
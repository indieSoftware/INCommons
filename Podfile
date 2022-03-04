source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '13.0'
use_frameworks!
workspace 'INCommons'

# Pods used for development only.
def development_pods
  # A linter to gather code metrics and enforce Swift style and conventions.
  # https://github.com/realm/SwiftLint
  # License: MIT
  pod 'SwiftLint'

  # Formats the Swift code to be consistent with the coding style guidelines.
  # https://github.com/nicklockwood/SwiftFormat
  # License: MIT
  pod 'SwiftFormat/CLI'
end

target 'INCommons' do
  development_pods
end

target 'INCommonsExample' do
  development_pods
end

# Post install

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      # Ignore any warnings from pods.
      config.build_settings['GCC_WARN_INHIBIT_ALL_WARNINGS'] = "YES"
      config.build_settings['SWIFT_SUPPRESS_WARNINGS'] = "YES"
      config.build_settings['APPLICATION_EXTENSION_API_ONLY'] = "YES"
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = "13.0"
    end
  end
end




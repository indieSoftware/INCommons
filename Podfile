source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

# Targets

target 'INCommons' do
	# A linter to gather code metrics.
	# https://github.com/realm/SwiftLint
	pod 'SwiftLint'

	# Formats the swift code to be consistent.
	# https://github.com/nicklockwood/SwiftFormat
	pod 'SwiftFormat/CLI'
end


# Post install

post_install do |installer|
	installer.pods_project.targets.each do |target|
		target.build_configurations.each do |config|
			# Ignore any warnings from pods.
			config.build_settings['GCC_WARN_INHIBIT_ALL_WARNINGS'] = "YES"
			config.build_settings['SWIFT_SUPPRESS_WARNINGS'] = "YES"
		end
	end
end

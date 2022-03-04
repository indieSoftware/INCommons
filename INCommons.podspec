Pod::Spec.new do |spec|
  spec.name         = "INCommons"
 spec.version = "2.0.0" # auto-generated
 spec.swift_version = "5.5.2" # auto-generated
  spec.summary      = "This Package provides common functionalities every iOS app can use."
  spec.description  = <<-DESC
  INCommons is a collection of small functions and extensions without any further dependencies. It's meant to be used in any app.
  DESC
  spec.homepage     = "https://github.com/indieSoftware/INCommons"
  spec.license      = 'MIT'
  spec.author       = { "Sven Korset" => "sven.korset@indie-software.com" }
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.ios.deployment_target = "13.0"
  spec.source       = { :git => "https://github.com/indieSoftware/INCommons.git", :tag => "#{spec.version}" }
  spec.source_files  = "Sources/INCommons/**/*.{swift}"
  spec.module_name   = 'INCommons'
end

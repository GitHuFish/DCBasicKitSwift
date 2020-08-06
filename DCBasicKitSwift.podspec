#
#  Be sure to run `pod spec lint DCBasicKitSwift.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name         = "DCBasicKitSwift"
  spec.version      = "0.0.1-alpha"
  spec.summary      = "A basic kit for a simple project."
  spec.description  = <<-DESC
  DCBasicKitSwift is a basic kit for the start of a project. It is in continuous improvement...
                   DESC
  spec.homepage     = "https://github.com/GitHuFish/DCBasicKitSwift"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "ducai" => "yuducai@outlook.com" }
  # spec.social_media_url   = "https://twitter.com/ducai"
  spec.platform     = :ios, "8.0"
  # spec.ios.deployment_target = "8.0"
  # spec.osx.deployment_target = "10.7"
  # spec.watchos.deployment_target = "2.0"
  # spec.tvos.deployment_target = "9.0"
  spec.source       = { :git => "https://github.com/GitHuFish/DCBasicKitSwift.git", :tag => "#{spec.version}" }
  spec.default_subspec = "DCBaseControllerSwift"
  spec.swift_versions = "4.0", "4.2", "5.0"
  # spec.source_files  = "Sources", "Sources/**/*.swift", "Sources/**/**/*.swift"
  # spec.exclude_files = "Classes/Exclude"
  # spec.public_header_files = "Classes/**/*.h"

  spec.subspec "DCGeneral" do |ss|
    ss.source_files  = "Sources/DCUtilitiesSwift/DCGeneral/"
    ss.framework  = "UIKit"
  end

  spec.subspec "DCExtensions" do |ss|
    ss.source_files  = "Sources/DCUtilitiesSwift/DCExtensions/"
    ss.dependency "DCBasicKitSwift/DCGeneral"
  end

  spec.subspec "DCBaseControllerSwift" do |ss|
    ss.source_files  = "Sources/DCBaseControllerSwift/"
    ss.dependency "DCBasicKitSwift/DCGeneral"
    ss.dependency "DCBasicKitSwift/DCExtensions"
  end
end

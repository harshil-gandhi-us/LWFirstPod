#
# Be sure to run `pod lib lint LWFirstPod.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LWFirstPod'
  s.version          = '0.1.1'
  s.summary          = 'A comprehensive iOS device information retrieval library.'

  s.description      = <<-DESC
LWFirstPod is a lightweight Swift library that provides easy access to various iOS device details, including battery status, network information, storage, memory usage, and more. It is designed to be easily integrated via CocoaPods or Swift Package Manager.
                       DESC

  s.homepage         = 'https://github.com/harshil-gandhi-us/LWFirstPod'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'harshil-gandhi-us' => 'harshil.gandhi@logicwind.com' }
  s.source           = { :git => 'https://github.com/harshil-gandhi-us/LWFirstPod.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'
  s.swift_version = '5.0'

  s.source_files = 'LWFirstPod/Classes/**/*'
  
  s.frameworks = 'UIKit', 'SystemConfiguration', 'Network'
  s.dependency 'ReachabilitySwift', '~> 5.0'
end

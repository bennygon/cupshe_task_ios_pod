#
# Be sure to run `pod lib lint cupshe_task_ios_pod.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'cupshe_task_ios_pod'
  s.version          = '0.1.0'
  s.summary          = 'cupshe_task_ios_pod.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "iOS SDK for cupshe task system"

  s.homepage         = 'https://github.com/sxzmail/cupshe_task_ios_pod'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sxzmail' => 'xiaozhong.shi@gmail.com' }
  s.source           = { :git => 'https://github.com/sxzmail/cupshe_task_ios_pod.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = 'cupshe_task_ios_pod/Classes/**/*'
  
  s.resources = ['cupshe_task_ios_pod/Assets/**/*', 'cupshe_task_ios_pod/Assets/*']
  
  # s.resource_bundles = {
  #   'cupshe_task_ios_pod' => ['cupshe_task_ios_pod/Assets/*.png']
  # }
  
  s.resource_bundles = {
    'cupshe_task_ios_pod' => ['cupshe_task_ios_pod/Assets/*.*']
  }

  s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.swift_versions = "5.0"
  # s.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }

  s.dependency "SwiftyJSON", "~> 5.0.1"
  s.dependency "Alamofire", "~> 5.8.0"
end

#
# Be sure to run `pod lib lint LeexTools.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LeexTools'
  s.version          = '0.1.0'
  s.summary          = '封装AFNetworking4.* + YYCache缓存网络请求及其他工具类'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: LeexTools是初始化新项目的得力工具，结构如下：
1.Network LXNetWork对AFNetworking4.* + YYCache进行封装，可缓存网络请求
2.Category 分类
3.Utils 工具类
DESC

  s.homepage         = 'https://github.com/leex05/LeexTools'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'leex05' => 'leex_ios@163.com' }
  s.source           = { :git => 'https://github.com/leex05/LeexTools.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'LeexTools/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LeexTools' => ['LeexTools/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
    s.dependency 'AFNetworking'
    s.dependency 'YYCache'
end

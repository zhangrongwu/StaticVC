#
# Be sure to run `pod lib lint StaticVC.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'StaticVC'
  s.version          = '1.0.0.3'
  s.summary          = 'A short description of StaticVC.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/zhangrongwu/StaticVC'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhangrongwu' => 'zhangrongwuios@icloud.com' }
  s.source           = { :git => 'https://github.com/zhangrongwu/StaticVC.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'StaticVC/**/**/*'
  
  # s.resource_bundles = {
  #   'StaticVC' => ['StaticVC/Assets/*.png']
  # }

  s.public_header_files = 'StaticVC/Headers/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'Masonry',  '~> 1.1.0'
  s.dependency 'IQKeyboardManager',  '~> 4.0.3'

end

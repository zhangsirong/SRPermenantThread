#
# Be sure to run `pod lib lint SRPermenantThread.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SRPermenantThread'
  s.version          = '0.1.0'
  s.summary          = '线程保活'
  s.description      = <<-DESC
    线程保活， 在同一条线程执行任务。
    DESC
  s.homepage         = 'https://github.com/zhangsirong/SRPermenantThread'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lpzsrong' => 'lpzsrong@gmail.com' }
  s.source           = { :git => 'https://github.com/zhangsirong/SRPermenantThread.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.source_files = 'SRPermenantThread/Classes/**/*'
 #s.public_header_files = 'Pod/Classes/**/*.h'
end

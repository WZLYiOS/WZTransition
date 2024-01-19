Pod::Spec.new do |s|

  s.name             = 'WZTransition'
  s.version          = '2.1.4'
  s.summary          = 'WZTransition转场动画'

  s.description      = <<-DESC
    深圳我主良缘有限公司,Dialog以及Menu过渡动画
                       DESC

  s.homepage         = 'https://github.com/WZLYiOS/WZTransition'
  s.license          = 'MIT'
  s.author           = { 'xiaobin liu'=> '327847390@qq.com' }
  s.source           = { :git => 'https://github.com/WZLYiOS/WZTransition.git', :tag => s.version.to_s }

  s.requires_arc = true
  s.static_framework = true
  s.swift_version         = '5.0'
  s.ios.deployment_target = '9.0'
  s.default_subspec = 'Source'

  s.subspec 'Source' do |ss|
    ss.source_files = 'WZTransition/Classes/**/*'
    ss.frameworks = 'UIKit'
    ss.frameworks = 'Foundation'
  end


#  s.subspec 'Binary' do |ss|
#    ss.vendored_frameworks = "Carthage/Build/iOS/Static/WZTransition.framework"
#    ss.user_target_xcconfig = { 'LIBRARY_SEARCH_PATHS' => '$(TOOLCHAIN_DIR)/usr/lib/swift/$(PLATFORM_NAME)' }
#  end
end


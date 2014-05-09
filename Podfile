platform :ios, "6.0"

pod 'SVProgressHUD', '1.0'
pod 'SVPullToRefresh', :head

post_install do |installer|
  installer.project.targets.each do |target|
    target.build_configurations.each do |configuration|
        target.build_settings(configuration.name)['ARCHS'] = '$(ARCHS_STANDARD_32_BIT)'
        target.build_settings(configuration.name)['VALID_ARCHS'] = 'armv7 armv7s'
        target.build_settings(configuration.name)['ONLY_ACTIVE_ARCH'] = 'NO'
    end
  end
end
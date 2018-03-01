Pod::Spec.new do |s|

  s.name         = "LBImagePreviewBrowser"
  s.version      = '0.0.2'
  s.summary      = 'LBImagePreviewBrowser is a image browser'

  s.description  = <<-DESC
                      Developer can use LBImagePreviewBrowser browse image set, Image set           		      may be PHAsset, ALAsset, NSURL, UIImage, a combination of one or 		      	      more of them. 
                    DESC

  s.homepage     = "https://github.com/libing0924/LBImagePreviewBrowser/"

  s.license      = "MIT"

  s.platform     = :ios, '8.0'

  s.author       = { "libing0924" => "404044359@qq.com" }

  s.source = { :git => "https://github.com/libing0924/LBImagePreviewBrowser.git", :tag => "#{s.version}" }

  s.source_files = 'LBImagePreviewBrowser/LBImagePreviewBrowser/LBImagePreviewBrowser/*.{h,m}'
# s.resource = ''
# s.frameworks = ''

# s.exclude_files = ['HardwareSDK/Classes/Hardwareframeworks/uSDK.framework','HardwareSDK/Classes/Hardwareframeworks/SmartCloudMobileSDK.framework']

#  s.ios.vendored_frameworks = ['HardwareSDK/Classes/Hardwareframeworks/uSDK.framework','HardwareSDK/Classes/Hardwareframeworks/SmartCloudMobileSDK.framework']

# s.dependency ""

end
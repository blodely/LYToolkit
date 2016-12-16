# Luo Yu
# indie.luo@gmail.com

Pod::Spec.new do |s|
  s.name             = 'LYTools'
  s.version          = '1.0.0'
  s.summary          = 'tools'

  s.description      = <<-DESC
collection of tools.
                       DESC

  s.homepage         = 'https://github.com/blodely/LYTool'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '骆昱' => 'indie.luo@gmail.com' }
  s.source           = { :git => 'https://github.com/blodely/LYTool.git', :tag => s.version.to_s }
  s.social_media_url = 'https://weibo.com/blodely'

  s.ios.deployment_target = '8.0'

  s.source_files = 'LYTools/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LYTools' => ['LYTools/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'AddressBook'
  # s.dependency 'AFNetworking', '~> 2.3'
end

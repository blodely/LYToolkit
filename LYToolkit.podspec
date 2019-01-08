# Luo Yu
# indie.luo@gmail.com

Pod::Spec.new do |s|
	s.name             = 'LYToolkit'
	s.version          = '1.0.0'
	s.summary          = 'Toolkit.'

	s.description      = <<-DESC
collection of tools.
                       DESC

	s.homepage         = 'https://github.com/blodely/LYToolkit'
	
	s.license          = { :type => 'MIT', :file => 'LICENSE' }
	s.author           = { '骆昱' => 'indie.luo@gmail.com' }
	s.source           = { :git => 'https://github.com/blodely/LYToolkit.git', :tag => s.version.to_s }
	s.social_media_url = 'https://weibo.com/blodely'

	s.ios.deployment_target = '10.0'

	s.source_files = 'LYToolkit/Classes/addressbook/*', 'LYToolkit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LYToolkit' => ['LYToolkit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
	s.frameworks = 'UIKit', 'AddressBook', 'MapKit'
	s.dependency 'LYCategory'
	
end

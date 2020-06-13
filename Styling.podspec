Pod::Spec.new do |spec|
  spec.name         = 'Styling'
  spec.version      = '0.0.1'
  spec.license      = 'MIT'
  spec.summary      = 'A light framework for Style with functions'
  spec.homepage     = 'https://github.com/jrBordet/Styling.git'
  spec.author       = 'Jean Raphaël Bordet'
  spec.source       = { :git => 'https://github.com/jrBordet/Styling.git', :tag => spec.version.to_s }
  spec.source_files = 'Styling/**/*.{swift}'
  spec.requires_arc = true
  spec.ios.deployment_target = '10.0'
  spec.dependency 'Caprice', '0.0.1'
end

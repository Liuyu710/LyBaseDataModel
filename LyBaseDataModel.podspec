Pod::Spec.new do |s|
  s.name = 'LyBaseDataModel'
  s.version = '1.0.0'
  s.license = 'MIT'
  s.summary = 'Swift'
  s.homepage = 'https://github.com/Liuyu710/LyBaseDataModel'
  s.authors = { 'LiuYu' => '232053394@qq.com' }
  s.source = { :git => 'https://github.com/Liuyu710/LyBaseDataModel.git', :tag => s.version }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'

  s.source_files = 'LyDataModelDemo/LyDataModelDemo/DataModel/LyBaseDataModel.swift'
  s.requires_arc = true
end
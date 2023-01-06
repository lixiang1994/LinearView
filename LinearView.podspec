Pod::Spec.new do |s|

s.name         = "LinearView"
s.version      = "1.1.0"
s.summary      = "基于UIStackView构建的线性布局视图 使用链式封装快速构建垂直或水平排版的视图"

s.homepage     = "https://github.com/lixiang1994/LinearView"

s.license      = { :type => "MIT", :file => "LICENSE" }

s.author       = { "LEE" => "18611401994@163.com" }

s.source       = { :git => "https://github.com/lixiang1994/LinearView.git", :tag => s.version }

s.requires_arc = true

s.swift_versions = ["5.0"]

s.frameworks = "Foundation"
s.ios.frameworks = "UIKit"

s.ios.deployment_target = '9.0'

s.source_files  = ["Sources/*.swift"]

end

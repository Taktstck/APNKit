Pod::Spec.new do |s|

  s.name         = "APNKit"
  s.version      = "0.1.0"
  s.summary      = "APNKit is helper library for Takt"
  s.homepage     = ""
  s.screenshots  = ""
  s.license      = { :type => "BSD" }
  s.author    = "1amageek"
  s.social_media_url   = "https://twitter.com/1_am_a_geek"
  s.platform     = :ios, "8.0"
  s.ios.deployment_target = "8.0"

  s.source       = { :git => "~/Dropbox/Stamp/repo/APNKit.git", :tag => "0.1.0" }
  s.source_files  = ["APNKit/**/*.{h,m}"]
  s.exclude_files = ['APNKit/AppDelegate.*', 'main.m']
  s.public_header_files = "APNKit/**/*.h"
  s.dependency "RestKit", "SSKeychain"

end

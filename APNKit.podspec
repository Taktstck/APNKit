Pod::Spec.new do |s|
  s.name         = "APNKit"
  s.version      = "0.2.2"
  s.summary      = "APNKit is Helper lib for Takt"
  s.license      = "MIT (example)"
  s.author             = { "1_am_a_geek" => "tmy0x3@icloud.com" }
  s.social_media_url   = "http://twitter.com/1_am_a_geek"
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/Taktstck/APNKit.git", :tag => "0.2.2" }
  s.source_files  = ["APNKit/**/*.{h,m}"]
  s.exclude_files = ["APNKit/**/AppDelegate.*", "APNKit/**/main.*", "APNKit/**/ViewController.*", "APNKit/**/Info.plist"]
  s.public_header_files = "APNKit/**/*.h"
  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"
  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"
  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  s.dependency "RestKit"

end

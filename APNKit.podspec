Pod::Spec.new do |s|
  s.name         = "APNKit"
  s.version      = "0.1.0"
  s.summary      = "APNKit is Helper lib for Takt"
  s.license      = "MIT (example)"
  s.author             = { "1_am_a_geek" => "tmy0x3@icloud.com" }
  s.social_media_url   = "http://twitter.com/1_am_a_geek"
  s.platform     = :ios
  s.platform     = :ios, "8.0"
  s.source       = { :git => "~/Dropbox/Stamp/repo/APNKit.git", :tag => "0.1.0" }
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"
  s.public_header_files = "Classes/**/*.h"
  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"
  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"
  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  s.dependency "RestKit", "~> 1.4"

end

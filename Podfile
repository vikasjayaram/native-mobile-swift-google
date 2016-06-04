platform :ios, "8.0"

inhibit_all_warnings!
use_frameworks!

target "SwiftSample" do
  pod "Lock", "~> 1.24"
  pod "Lock-Facebook", "~> 2.2"
  pod "Google/SignIn", "~> 3.0.0"
  pod "JWTDecode", "~> 1.0"
  pod "SimpleKeychain", "~> 0.3"
  pod "MBProgressHUD", "~> 0.9"
end

post_install do |installer|
    installer.pods_project.build_configurations.each { |bc|
        bc.build_settings['CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES'] = 'YES'
    }
end

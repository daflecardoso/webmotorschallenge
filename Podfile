# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

# ignore all warnings from all pods
inhibit_all_warnings!

def shared_pods

  pod 'RxSwift', '~> 6.0'
  pod 'RxCocoa', '~> 6.0'
  pod 'RxKeyboard'
  pod 'Moya/RxSwift', '~> 15.0.0'
  pod 'Kingfisher', '~> 6.3.1'
  pod 'SwiftKeychainWrapper'
  pod 'SnapKit', '~> 5.0.0'
  pod 'NotificationBannerSwift', '~> 3.0.0'

end

target 'WebmotorsChallenge' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  shared_pods
  # Pods for WebmotorsChallenge

  target 'WebmotorsChallengeTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'WebmotorsChallengeUITests' do
    # Pods for testing
  end

end

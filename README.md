## MVVM Architecture:

![Architecture](https://github.com/daflecardoso/webmotorschallenge/blob/main/WebmotorsChallenge/architecture.png)

## App Preview:

| Light | Dark |
| ------------- | ------------- |
| ![Light](https://github.com/daflecardoso/webmotorschallenge/blob/main/light_mode.gif)| ![Dark](https://github.com/daflecardoso/webmotorschallenge/blob/main/dark_mode.gif) |

## Project used libraries:

```ruby
  pod 'RxSwift', '~> 6.0' #(Reactive programming)
  pod 'RxCocoa', '~> 6.0' #(Reactive programming)
  pod 'Moya/RxSwift', '~> 15.0.0' #(Reactive programming and Network)
  pod 'Kingfisher', '~> 6.3.1' #(Preview and caching images)
  pod 'SnapKit', '~> 5.0.0' #(Constraint helper)
  pod 'NotificationBannerSwift', '~> 3.0.0' #(Banner dialog)
```

## Run Steps:

```sh
git clone git@github.com:daflecardoso/webmotorschallenge.git

cd webmotorschallenge
pod install
open WebmotorsChallenge.xcworkspace
```

## How to run UnitTests?

1 - Command + 6

2 - Right click on **first** option **WebmotorsChallengeTests** and choose first option **Run "WebmotorsChallengeTests"**

## How to run UITests?

1 - Command + 6

2 - Right click on **second** option **WebmotorsChallengeTests** and choose first option **Run "WebmotorsChallengeUITests"**

## Aditional Informations:

| Total UnitTests | Total UITests | App font |
| ------------- | ------------- | ------------- |
| 26 | 3 | Rajdhani |

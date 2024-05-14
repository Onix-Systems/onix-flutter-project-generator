# {app_name} Technical description

This file contains a description of technologies, packages and libraries used in {app_name} project. 

## Main Technologies

### Core packages
* [GetIt](https://pub.dev/packages/get_it) - service locator, used for fast and effective access to objects
* [Screen Util](https://pub.dev/packages/flutter_screenutil) - adaptive UI tools providing autoscaling UI features 
* [Go Router](https://pub.dev/packages/go_router) - navigation library that complies with Flutter Navigation 2.0 
* [Freezed](https://pub.dev/packages/freezed_annotation) - code generation of data classes with boilerplate functions

### Local storage and database 

* [Hive](https://pub.dev/packages/hive) - effective noSQL database
* [Shared Preferences](https://pub.dev/packages/shared_preferences) - key-value storage

### Networking 

* [Dio](https://pub.dev/packages/dio) - Http client
* [Json Annotation](https://pub.dev/packages/json_annotation) - code generation based JSON parsing utility

### State management 

* [Bloc](https://pub.dev/packages/flutter_bloc) - state management

### UI

* [Native Splash](https://pub.dev/packages/flutter_native_splash) - utility to generate splash screen from yaml configuration(in `pubspec.yaml`) 

## Build runner

{app_name} project uses Build Runner to generate additional code. This features mostly used in **freezed** and **jsonAnnotation** utilities. So when you changing build runner related classes you need to regenerate additional generated classes (mostly it's `*.g.dart`, `*.freezed.dart` classes). 

To generate classes:

`flutter packages pub run build_runner build`

Use the [watch] flag to watch the files' system for edits and rebuild as necessary.

`flutter packages pub run build_runner watch`

If you have conflicts use command:

`flutter pub run build_runner build --delete-conflicting-outputs`

## Launcher Icons

{app_name} uses [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) plugin fro quick generation on icons for mobile applications. Flutter Launcher Icons configuration placed in pubspec.yaml (`flutter_launcher_icons` section) or in config file called `flutter_launcher_icons.yaml`. 
After you changing configuration or icon images need to rerun icons generation to apply changes using command:

`flutter pub run flutter_launcher_icons:main`

If project contains flavors and need to regenerate icons for ech flavor run:

`flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons*`

{flavorizr_instructions}

## Deep links

{app_name} has a deep link features, and here describe all deep links options are available in the application.

Deep links schemes are:

* Android: `https://dev-backend.myapp.com/{action}`
* iOS: `myappappscheme://myapp.com/{action}`
* iOS Unilink: `https://dev-backend.myapp.com/{action}`

Deeplink actions:

* Move money (deeplink to open transfer money to some user): `move_money`

### Testing Deep links
**Android:**
```
adb shell am start -a android.intent.action.VIEW \
-c android.intent.category.BROWSABLE \
-d https://dev-backend.myapp.com/move_money
```

**iOS Scheme links:**

`xcrun simctl openurl booted myappappscheme://myapp.com/move_money`

**IOS Uni Links:**

`xcrun simctl openurl booted https://dev-backend.myapp.com/move_money`

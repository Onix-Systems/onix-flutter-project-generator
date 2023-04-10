# onix_flutter_bricks

Onix Flutter Clean Architecture mason bricks

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials, samples, guidance on
mobile development, and a full API reference.

[master]:

## flutter clean && flutter build macos --release && ditto -c -k --sequesterRsrc --keepParent build/macos/Build/Products/Release/onix_flutter_bricks.app release/onix_flutter_bricks.zip && git commit -am "release" && git -c core.quotepath=false -c log.showSignature=false push --progress --porcelain gitlab refs/heads/master:master

[testing]:

## flutter clean && flutter build macos --release && ditto -c -k --sequesterRsrc --keepParent build/macos/Build/Products/Release/onix_flutter_bricks.app release/onix_flutter_bricks.zip && git commit -am "release" && git -c core.quotepath=false -c log.showSignature=false push --progress --porcelain gitlab refs/heads/testing:testing

# {app_name} Installation guide

This section describes different installation options. It consists of the following parts:

* Terminology
* Platforms supported
* Environment variables and setup
* Important installation instructions
* How to run {app_name} application locally
* How to run {app_name} automatic tests
* How to build {app_name} application



## Terminology

* **Output Type** - platform keyword used in run or build commands to specify for what platform app will be built. Available platforms are:

```
{output_types}
```
Apk and AppBundle refers to Android and specifies a type of output file (`*.apk` or `*.aab`).

{app_flavors}

* **Build type** - type of build process: `release` or `debug`.
* **main.dart** file - main file and entry point of your application. {main_count_description}:

```
{app_main_files}
```

When you specifying a flavor in run or build command you also need to specify corresponding `main.dart` file for that flavor.

## Platforms supported

{app_name} application supported on following platforms:

{app_platforms}

## Important installation instructions

Before opening {app_name} project make sure that you have installed followed software on your Mac or PC:

* IDE (Android Studio or VSCode)
* Dart SDK
* Flutter SDK and Flutter plugin for IDE

When you sure you installed followed software follow steps to prepare {app_name} project to build.

* Open project folder in your IDE and wait for project indexing finished
* Open IDE terminal and run `dart pub get` command and wait to complete and import errors disappeared

## Environment variables and setup

To add project environment keys need to create `.env` file in root folder for each of flavors:

```
{app_env_files}
```

{app_env_explanation}
Environment file scheme:

```
STRIPE_KEY=enter_stripe_key
OPENAI_PUBLIC_KEY=enter_openAi_key
```
## How to run {app_name} application locally

To run {app_name} application locally on device follow steps:

* Connect device or open an device emulator and make sure it appeared in devices list in IDE;
* Select build configuration in Flutter plugin toolbar
* Press Run button

You can use commands to run applications also. To run app:

* Open IDE terminal
* Run command `flutter run --flavor {flavor} --{build_type} -t {path_to_main.dart}`

## How to run {app_name} automatic tests

{app_name} application is covered with **unit** and **widgets** tests.
The goal of a unit test is to verify the correctness of a unit of logic under a variety of conditions.
The goal of a widget test is to verify that the widget’s UI looks and interacts as expected.

To lauch all tests run following command in IDE terminal:

`flutter test`

To launch specific test run following command in IDE terminal:

`flutter test {path_to test_file.dart}`

## How to build {app_name} application

To build application open IDE terminal use following command:

`flutter build {output_type} --flavor {flavor} --release -t {{path_to_main.dart}}`

Add obfuscation params if you build application for mobile platforms:
`--obfuscate --split-debug-info=debug_info`

Next step is depending on platform:

* For iOS and MacOS open ios/macos folder of project in XCode and follow instructions How to upload app to AppStore
* For Android you'll see the location of the output file in the terminal after build finished. Follow the instruction to upload build to Play Store
* For Web - after build completed - deploy content of `/web` folder to your server

## How to build and distribute {app_name} application using fastlane

Before you use fastlane to build and distribute:

1. Make sure you are using **ruby version 3.0 or newer**
2. Using the iOS build, call `xcode-select --install`
3. Install fastlane using `brew install fastlane` or `gem install fastlane`
4. Install the bundler using `gem install bundler`
5. Go to the `android` & `ios` directory and call `[sudo] bundle install`

To submit a build to the App Store or Google Play Console you need:

**For iOS:**

1. If the `.env.{flavor}` file is not created, create it in the `/ios/fastlane/` folder
2. Go to the Apple Developer portal and create an AppStoreConnect API key, save it, then open the file and copy the contents of that file, not including the `BEGIN PRIVATE KEY` and `END PRIVATE KEY` with dashes. Then add this key in `.env.{flavor}` to the `KEY_CONTENT` variable
3. After creating the key, copy the `ISSUER_ID`, `KEY_ID` variables and add them to `.env.{flavor}`
4. After that, add a few more variables `BUNDLE_ID`, `APPLE_DEVELOPER_USERNAME`, `APP_STORE_CONNECT_TEAM_ID`, `DEVELOPER_PORTAL_TEAM_ID`. You can find them on the Apple Developer portal and AppStore Connect

For more information on creating a AppStore Connect API key go to [Creating API Keys for App Store Connect API](https://developer.apple.com/documentation/appstoreconnectapi/creating_api_keys_for_app_store_connect_api)

**For Android:**

1. If the `.env.{flavor}` file is not created, create it in the `/android/fastlane/` folder
2. Download and save the service account key and place it in the project folder
3. Specify the relative path to the service account key by adding the `JSON_KEY_FILE` variable to `.env.{flavor}`
4. Specify the applicationId in the `PACKAGE_NAME` variable to `.env.{flavor}`

For more information on creating a service account key go to [Google Play Developer API](https://developers.google.com/android-publisher/getting_started/?hl=en) portal

To submit a build to the Firebase App Distribution you need:

1. Install Firebase CLI using `curl -sL firebase.tools | bash`
2. Sign in using the Firebase CLI `firebase login`
3. Create the `.env.{flavor}` file in `/android/fastlane/` and `/ios/fastlane/` if it was not created earlier
4. Add the `FIREBASE_APP_ID` variable to the file by specifying the `app_id`, which you can find in the Firebase Console

For more detailed information you can go to [Firebase App Distribution Android](https://firebase.google.com/docs/app-distribution/ios/distribute-fastlane) and [Firebase App Distribution iOS](https://firebase.google.com/docs/app-distribution/android/distribute-fastlane)

Now you can build and distribute the build using the Makefile command:

**For iOS:**

* TestFlight and Firebase App Distribution  `make build_{flavor}_ios_with_distribution`
* Firebase App Distribution only `make build_{flavor}_ios_firebase_only`
* TestFlight only `make build_{flavor}_ios_test_flight_only`

> Make sure the correct signing method is selected in Xcode under the "Signing & Capabilities" tab, and if signing manually, the correct Provisioning Profile and Certificate are selected as well

**For Android:**

* Play Store and Firebase App Distribution `make build_{flavor}_android_with_distribution`
* Firebase App Distribution only `make build_{flavor}_android_firebase_only`
* Play Store only `make build_{flavor}_android_store_only`

> Make sure when submitting a build to the Play Store android artifact type is "aab"
> Make sure when submitting a build to the Firebase App Distribution android artifact type is "apk" (if you have not set up firebase integration with your Google Play project)

For more flexible build or distribution settings, you can change the parameters specified in `fastlane_config.yaml`

## Possible build errors

### Some files are underlined red in project file tree:

Try to run `dart pub get` command in IDE terminal

### When you build an iOS or MacOS application you might get Pod's issue.

To fix that run following command in IDE terminal:

`cd ios && pod cache clean --all && pod repo update && pod update && cd .. && flutter clean && flutter pub get`   

## Automatic posting of release notes to slack after build through fastlane

In order for fastlane to send release notes to slack channel you need:

1. Install the `git cliff` generator [following this link](https://git-cliff.org/docs/)
2. Make sure that the `cliff_txt.toml` and `cliff_md.toml` files are created in the project root and configured correctly
3. Make sure the git repository is initialized in the project, you have at least one commit and a git tag with the release version is set on the last commit
4. Go to the ios or android fastlane directory, then and add/update the key `SLACK_URL` with a incoming webhook URL to each `.env_{flavor_name)` file
5. Optionally. In `fastlane_config.yaml` you can specify additional settings for slack

Now you can build and deploy builds through fastlane with message notification and release notes to the slack channel

## Manual creation of release notes and changelogs

You can also generate release notes and changelog without using fastlane. To do this you need to:

1. Install the `git cliff` generator [following this link](https://git-cliff.org/docs/)
2. Make sure that the `cliff_txt.toml` and `cliff_md.toml` files are created in the project root and configured correctly
3. Make sure the git repository is initialized in the project, you have at least one commit and a git tag with the release version is set on the last commit
4. To generate release notes, call the `make release_notes` command in the terminal
5. To generate a CHANGELOG, call the `make changelog` command in the terminal 

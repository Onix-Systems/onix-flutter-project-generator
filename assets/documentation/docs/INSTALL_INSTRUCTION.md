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


* **Flavor** - type of application configuration. {app_name} supports following flavors: 

```
{app_flavors}
```

* **Build type** - type of build process: `release` or `debug`.
* **main.dart** file - main file and entry point of your application. This applications have 2 flavors, so it have 2 different entry poins and `main.dart` files:

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

`flutter build {output_type} --flavor {flavor} -t {{path_to_main.dart}}`

Add obfuscation params if you build application for mobile platforms:
`--obfuscate --split-debug-info=debug_info`

Next step is depending on platform:

* For iOS and MacOS open ios/macos folder of project in XCode and follow instructions How to upload app to AppStore
* For Android you'll see the location of the output file in the terminal after build finished. Follow the instruction to upload build to Play Store
* For Web - after build completed - deploy content of `/web` folder to your server  

## Possible build errors

### Some files are underlined red in project file tree:

Try to run `dart pub get` command in IDE terminal

### When you build an iOS or MacOS application you might get Pod's issue. 

To fix that run following command in IDE terminal:

`cd ios && pod cache clean --all && pod repo update && pod update && cd .. && flutter clean && flutter pub get`   

 





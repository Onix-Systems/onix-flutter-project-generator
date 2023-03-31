# Onix Flutter Clean Architecture Project Brick

## Features:

* Generates Onix Flutter Clean Architecture
  project (https://github.com/OnixFlutterTeam/clean_arch_sample)
* Generates flavors if flavorize option is selected (DEV & PROD flavors added automatically) with
  ability to add own flavors (STAGE, etc.)
* Generates base navigation with choose from AutoRouter & GoRouter
* Generates localizations with choose from flutter_gen & Intl
* Integrates DevicePreview if this option selected
* Generates signing key for project if this option selected

## Install:

First install mason_cli:

`dart pub global activate mason_cli`

Then add 'flutter_clean_base' brick globally:

`mason add -g flutter_clean_base --git-url https://github.com/OnixFlutterTeam/flutter_clean_mason_template.git --git-path flutter_clean_base`

Be sure brick is installed sucessfully:

`mason ls -g`

To use brick go to you projects folder and do:

`mason make flutter_clean_base --on-conflict overwrite`

To delete brick:

`mason remove -g flutter_clean_base`

## :warning: After generation complete open Runner in Xcode & change iOS Deployment Target to 12.0

# :biohazard: Onix Flutter Clean Architecture Entity Brick

## Features:

* Generates entities according to Onix Flutter Clean
  Architecture (https://github.com/OnixFlutterTeam/clean_arch_sample)
* Options: generate request, generate response
* Generates entities array with same options
* Generates mapper if request or response option choosed

## Install:

### :warning: Be sure you use Onix Flutter Clean Architecture (otherwise brick will generate entities in wrong folders) :warning:

Add 'flutter_clean_entity' brick globally:

`mason add -g flutter_clean_entity --git-url https://github.com/OnixFlutterTeam/flutter_clean_mason_template.git --git-path flutter_clean_entity`

Be sure brick is installed sucessfully:

`mason ls -g`

To use brick go to you projects folder and do:

`mason make flutter_clean_entity --on-conflict overwrite`

To delete brick:

`mason remove -g flutter_clean_entity`

# :biohazard: Onix Flutter Clean Architecture Screen Brick

## Features:

* Generates screens according to Onix Flutter Clean
  Architecture (https://github.com/OnixFlutterTeam/clean_arch_sample)
* Generates routes according to project router (goRouter or AutoRouter - detects automatically)
* Generates bloc folder & classes if use bloc option choosed

## Install:

### :warning: Be sure you use Onix Flutter Clean Architecture (otherwise brick will generate entities in wrong folders) :warning:

Add 'flutter_clean_screen' brick globally:

`mason add -g flutter_clean_screen --git-url https://github.com/OnixFlutterTeam/flutter_clean_mason_template.git --git-path flutter_clean_screen`

Be sure brick is installed sucessfully:

`mason ls -g`

To use brick go to you projects folder and do:

`mason make flutter_clean_screen --on-conflict overwrite`

To delete brick:

`mason remove -g flutter_clean_screen`

# :biohazard: Delete ALL bricks:

`mason cache clear`
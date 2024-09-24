
build:
	@flutter clean
	@flutter build macos --release
	@mkdir release
	@appdmg installers/dmg_creator/config.json release/Onix_Flutter_Project_Generator.dmg

build_runner:
	fvm dart pub run build_runner build --delete-conflicting-outputs
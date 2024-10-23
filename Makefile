
build_macos:
	@rm -rf release
	fvm flutter clean
	fvm flutter build macos --release
	@mkdir release
	@appdmg installers/dmg_creator/config.json release/Onix_Flutter_Project_Generator.dmg

build_runner:
	fvm dart run build_runner build --delete-conflicting-outputs

codegen:
	dart run build_runner build --delete-conflicting-outputs
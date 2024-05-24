// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(componentName) => "${componentName} component preview";

  static String m1(componentName) =>
      "Data component ${componentName} already exists";

  static String m2(sourceName) => " in ${sourceName} source";

  static String m3(componentName) =>
      "Do you really want to delete component ${componentName}?";

  static String m4(projectName) => "Modify ${projectName}";

  static String m5(sourceName) =>
      "Do you really want to delete source ${sourceName}?";

  static String m6(sourceName) => "${sourceName}Source already exists";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "actions": MessageLookupByLibrary.simpleMessage("Actions"),
        "addComponent": MessageLookupByLibrary.simpleMessage("Add component"),
        "addField": MessageLookupByLibrary.simpleMessage("Add field"),
        "addFlavors": MessageLookupByLibrary.simpleMessage("Add flavors:"),
        "addScreen": MessageLookupByLibrary.simpleMessage("Add screen"),
        "addSource": MessageLookupByLibrary.simpleMessage("Add source"),
        "alsoReadThis": MessageLookupByLibrary.simpleMessage("Also read this"),
        "apiFailureNoNetwork": MessageLookupByLibrary.simpleMessage(
            "Sorry, we\'re having trouble connecting. Please check your internet connection and try again.\n\nReach out to support if you continue to experience issues."),
        "apiFailureTooManyRequests": MessageLookupByLibrary.simpleMessage(
            "Uh oh! Looks like we ran into an issue while processing this request. Please try again.\n\nReach out to support if you continue to experience issues."),
        "apiFailureUnAuthorized": MessageLookupByLibrary.simpleMessage(
            "The username or password you entered is incorrect."),
        "apiFailureUndefined": MessageLookupByLibrary.simpleMessage(
            "Uh oh! Looks like we ran into an issue while processing this request. Please try again.\n\nReach out to support if you continue to experience issues."),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "checkNamesContentFirstPart":
            MessageLookupByLibrary.simpleMessage("Is project name\n"),
        "checkNamesContentLastPart":
            MessageLookupByLibrary.simpleMessage("\nlooking reasonable?"),
        "checkNamesContentSecondPart":
            MessageLookupByLibrary.simpleMessage("\nand organization\n"),
        "checkNamesTitle":
            MessageLookupByLibrary.simpleMessage("Check names before continue"),
        "cityOrLocality":
            MessageLookupByLibrary.simpleMessage(" City or Locality"),
        "colorStyles": MessageLookupByLibrary.simpleMessage("Color Styles"),
        "componentNamePlaceholder":
            MessageLookupByLibrary.simpleMessage("Component name"),
        "componentPreview": m0,
        "continueLabel": MessageLookupByLibrary.simpleMessage("Continue"),
        "createRequestCheckboxLabel":
            MessageLookupByLibrary.simpleMessage("Create request?"),
        "createResponseCheckboxLabel":
            MessageLookupByLibrary.simpleMessage("Create response?"),
        "dataComponent": MessageLookupByLibrary.simpleMessage("Data component"),
        "dataComponentExistsError": m1,
        "dataComponentExistsInSource": m2,
        "dataComponents":
            MessageLookupByLibrary.simpleMessage("Data components"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteComponentConfirmation": m3,
        "dialogWillOpenInSeparateWindow": MessageLookupByLibrary.simpleMessage(
            "(Dialog will open in separate window)"),
        "emptyConfigContent": MessageLookupByLibrary.simpleMessage(
            "Config file is not exists or not valid! Check is opened project was generated with Onix Flutter Project Generator"),
        "emptyConfigTitle":
            MessageLookupByLibrary.simpleMessage("Config file load error!"),
        "error": MessageLookupByLibrary.simpleMessage("Error"),
        "exitLabel": MessageLookupByLibrary.simpleMessage("Exit"),
        "fields": MessageLookupByLibrary.simpleMessage("Fields"),
        "figmaFileKey": MessageLookupByLibrary.simpleMessage("Figma file key"),
        "figmaGetStylesEmpty": MessageLookupByLibrary.simpleMessage(
            "No styles found in this file"),
        "figmaGetStylesEmptyFileId":
            MessageLookupByLibrary.simpleMessage("Figma file id is empty"),
        "figmaGetStylesEmptyToken":
            MessageLookupByLibrary.simpleMessage("Figma token is empty"),
        "figmaGetStylesError": MessageLookupByLibrary.simpleMessage(
            "Error loading styles: check internet connection, figma file id and token"),
        "figmaToken": MessageLookupByLibrary.simpleMessage("Figma token"),
        "firebaseAuth": MessageLookupByLibrary.simpleMessage(
            "Integrate Firebase with FirebaseAuth?"),
        "firstLastName":
            MessageLookupByLibrary.simpleMessage(" First & last name"),
        "flavorize": MessageLookupByLibrary.simpleMessage("Flavorize?"),
        "flavors": MessageLookupByLibrary.simpleMessage("Flavors"),
        "generate": MessageLookupByLibrary.simpleMessage("Generate"),
        "generateAndroidSigning": MessageLookupByLibrary.simpleMessage(
            "Generate Android signing config"),
        "generateNewProject":
            MessageLookupByLibrary.simpleMessage("Generate new project"),
        "generateProject":
            MessageLookupByLibrary.simpleMessage("Generate project"),
        "generateScreens":
            MessageLookupByLibrary.simpleMessage("Generate screens"),
        "generateSigningKey":
            MessageLookupByLibrary.simpleMessage("Generate signing key?"),
        "generateSonarConfig":
            MessageLookupByLibrary.simpleMessage("Generate Sonar config?"),
        "getFromSwagger":
            MessageLookupByLibrary.simpleMessage("Get from swagger"),
        "getStylesFromFigma":
            MessageLookupByLibrary.simpleMessage("Get styles from Figma"),
        "gitPermissionsContent": MessageLookupByLibrary.simpleMessage(
            "Git permissions error! Check is git installed and you have permissions to use it or try to add git key to apple keychain."),
        "gitPermissionsTitle":
            MessageLookupByLibrary.simpleMessage("Git permissions error!"),
        "goBack": MessageLookupByLibrary.simpleMessage("Back"),
        "ignore": MessageLookupByLibrary.simpleMessage("Ignore"),
        "integrateDevicePreview":
            MessageLookupByLibrary.simpleMessage("Integrate Device Preview?"),
        "integrateGraphQl":
            MessageLookupByLibrary.simpleMessage("Integrate GraphQL?"),
        "keyStorePasswordPlaceholder":
            MessageLookupByLibrary.simpleMessage("Leave blank to auto-gen..."),
        "keystorePassword":
            MessageLookupByLibrary.simpleMessage(" Keystore password"),
        "list": MessageLookupByLibrary.simpleMessage("List"),
        "localization": MessageLookupByLibrary.simpleMessage("Localization:"),
        "localizationMethod":
            MessageLookupByLibrary.simpleMessage("Localization method"),
        "masonBrickSource":
            MessageLookupByLibrary.simpleMessage("Mason Brick source"),
        "modify": MessageLookupByLibrary.simpleMessage("Modify"),
        "modifyComponent":
            MessageLookupByLibrary.simpleMessage("Modify component"),
        "modifyGeneratedProject": m4,
        "modifyScreen": MessageLookupByLibrary.simpleMessage("Modify screen"),
        "modifySigningVars":
            MessageLookupByLibrary.simpleMessage("Modify signing vars..."),
        "modifySource": MessageLookupByLibrary.simpleMessage("Modify source"),
        "navigationRouter":
            MessageLookupByLibrary.simpleMessage("Navigation router"),
        "newVersionAvailableContent": MessageLookupByLibrary.simpleMessage(
            "New version of Onix Flutter Project Generator is available. Do you want to download it?"),
        "newVersionAvailableTitle":
            MessageLookupByLibrary.simpleMessage("New version available"),
        "no": MessageLookupByLibrary.simpleMessage("No"),
        "nullable": MessageLookupByLibrary.simpleMessage("Nullable"),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "openExistingProject":
            MessageLookupByLibrary.simpleMessage("Open existing project"),
        "openInAndroidStudio":
            MessageLookupByLibrary.simpleMessage("Open in Android Studio"),
        "organization": MessageLookupByLibrary.simpleMessage("Organization"),
        "organizationalUnit":
            MessageLookupByLibrary.simpleMessage(" Organizational unit"),
        "pathNotSelectedContent": MessageLookupByLibrary.simpleMessage(
            "You must select path to projects folder"),
        "pathNotSelectedTitle":
            MessageLookupByLibrary.simpleMessage("Path not selected"),
        "placeURLTitle": MessageLookupByLibrary.simpleMessage("Place URL here"),
        "platforms": MessageLookupByLibrary.simpleMessage("Platforms"),
        "preview": MessageLookupByLibrary.simpleMessage("Preview"),
        "projectExistsError": MessageLookupByLibrary.simpleMessage(
            "Project already exists, choose different name"),
        "projectName": MessageLookupByLibrary.simpleMessage("Project name"),
        "projectPath": MessageLookupByLibrary.simpleMessage("Project path"),
        "projectSelectErrorMessage": MessageLookupByLibrary.simpleMessage(
            "Pubspec file not found in selected folder."),
        "projectSelectErrorTitle":
            MessageLookupByLibrary.simpleMessage("Not a Flutter Project"),
        "replace": MessageLookupByLibrary.simpleMessage("Replace"),
        "request": MessageLookupByLibrary.simpleMessage("Request"),
        "response": MessageLookupByLibrary.simpleMessage("Response"),
        "retry": MessageLookupByLibrary.simpleMessage("Retry"),
        "router": MessageLookupByLibrary.simpleMessage("Router:"),
        "screenAlreadyExistsContent": MessageLookupByLibrary.simpleMessage(
            "Screen with such name already exists"),
        "screenAlreadyExistsTitle":
            MessageLookupByLibrary.simpleMessage("Already exists"),
        "screenName": MessageLookupByLibrary.simpleMessage("Screen name"),
        "screens": MessageLookupByLibrary.simpleMessage("Screens"),
        "signingErrorException": MessageLookupByLibrary.simpleMessage(
            "Failed to create signing config. Is Android platform enabled and android folder exist?"),
        "signingErrorExist": MessageLookupByLibrary.simpleMessage(
            "Failed to create signing config. Certificate of configuration already exist."),
        "signingErrorParams": MessageLookupByLibrary.simpleMessage(
            "Failed to create signing config. Internal error happened, please contact a developer."),
        "signingToolSuccessText": MessageLookupByLibrary.simpleMessage(
            "Keystore and signing configuration created."),
        "signingToolTitle": MessageLookupByLibrary.simpleMessage(
            "Android signing configuration"),
        "signingVars": MessageLookupByLibrary.simpleMessage("Signing vars"),
        "sourceDeletingDialogTitle": m5,
        "sourceExistsError": m6,
        "sourceNamePlaceholder":
            MessageLookupByLibrary.simpleMessage("Source name"),
        "sources": MessageLookupByLibrary.simpleMessage("Sources"),
        "spaceSeparated":
            MessageLookupByLibrary.simpleMessage("(space separated)"),
        "standaloneDataComponents":
            MessageLookupByLibrary.simpleMessage("Standalone data components:"),
        "stateManager": MessageLookupByLibrary.simpleMessage("State manager"),
        "stateOrProvince":
            MessageLookupByLibrary.simpleMessage(" State or Province"),
        "swaggerParserPrompt": MessageLookupByLibrary.simpleMessage(
            "Paste swagger config json file URL here to get data components from API\nor leave it empty to use default config"),
        "swaggerParserScreenConflictError": MessageLookupByLibrary.simpleMessage(
            "Swagger file contains components conflicting with existing. Replace with parsed components or ignore conflicting parsed data?"),
        "swaggerURL": MessageLookupByLibrary.simpleMessage("Swagger URL"),
        "textStyles": MessageLookupByLibrary.simpleMessage("Text Styles"),
        "theming": MessageLookupByLibrary.simpleMessage("Theming"),
        "title": MessageLookupByLibrary.simpleMessage(
            "Onix Flutter Project Generator"),
        "tools": MessageLookupByLibrary.simpleMessage("Tools"),
        "twoLetterCountryCode":
            MessageLookupByLibrary.simpleMessage(" Two-letter country code"),
        "url": MessageLookupByLibrary.simpleMessage("URL"),
        "useSonar": MessageLookupByLibrary.simpleMessage("Will you use Sonar?"),
        "usingBloc": MessageLookupByLibrary.simpleMessage("Using BLoC"),
        "usingCubit": MessageLookupByLibrary.simpleMessage("Using Cubit"),
        "willBeAddedAutomatically": MessageLookupByLibrary.simpleMessage(
            "DEV & PROD flavors will be added automatically"),
        "withComponents":
            MessageLookupByLibrary.simpleMessage("With components"),
        "yes": MessageLookupByLibrary.simpleMessage("Yes")
      };
}

// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Onix Flutter Project Generator`
  String get title {
    return Intl.message(
      'Onix Flutter Project Generator',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, we're having trouble connecting. Please check your internet connection and try again.\n\nReach out to support if you continue to experience issues.`
  String get apiFailureNoNetwork {
    return Intl.message(
      'Sorry, we\'re having trouble connecting. Please check your internet connection and try again.\n\nReach out to support if you continue to experience issues.',
      name: 'apiFailureNoNetwork',
      desc: '',
      args: [],
    );
  }

  /// `The username or password you entered is incorrect.`
  String get apiFailureUnAuthorized {
    return Intl.message(
      'The username or password you entered is incorrect.',
      name: 'apiFailureUnAuthorized',
      desc: '',
      args: [],
    );
  }

  /// `Uh oh! Looks like we ran into an issue while processing this request. Please try again.\n\nReach out to support if you continue to experience issues.`
  String get apiFailureTooManyRequests {
    return Intl.message(
      'Uh oh! Looks like we ran into an issue while processing this request. Please try again.\n\nReach out to support if you continue to experience issues.',
      name: 'apiFailureTooManyRequests',
      desc: '',
      args: [],
    );
  }

  /// `Uh oh! Looks like we ran into an issue while processing this request. Please try again.\n\nReach out to support if you continue to experience issues.`
  String get apiFailureUndefined {
    return Intl.message(
      'Uh oh! Looks like we ran into an issue while processing this request. Please try again.\n\nReach out to support if you continue to experience issues.',
      name: 'apiFailureUndefined',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueLabel {
    return Intl.message(
      'Continue',
      name: 'continueLabel',
      desc: '',
      args: [],
    );
  }

  /// `Modify`
  String get modify {
    return Intl.message(
      'Modify',
      name: 'modify',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Replace`
  String get replace {
    return Intl.message(
      'Replace',
      name: 'replace',
      desc: '',
      args: [],
    );
  }

  /// `Ignore`
  String get ignore {
    return Intl.message(
      'Ignore',
      name: 'ignore',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Exit`
  String get exitLabel {
    return Intl.message(
      'Exit',
      name: 'exitLabel',
      desc: '',
      args: [],
    );
  }

  /// `Swagger file contains components conflicting with existing. Replace with parsed components or ignore conflicting parsed data?`
  String get swaggerParserScreenConflictError {
    return Intl.message(
      'Swagger file contains components conflicting with existing. Replace with parsed components or ignore conflicting parsed data?',
      name: 'swaggerParserScreenConflictError',
      desc: '',
      args: [],
    );
  }

  /// `Generate new project`
  String get generateNewProject {
    return Intl.message(
      'Generate new project',
      name: 'generateNewProject',
      desc: '',
      args: [],
    );
  }

  /// `Generate project`
  String get generateProject {
    return Intl.message(
      'Generate project',
      name: 'generateProject',
      desc: '',
      args: [],
    );
  }

  /// `Modify {projectName}`
  String modifyGeneratedProject(Object projectName) {
    return Intl.message(
      'Modify $projectName',
      name: 'modifyGeneratedProject',
      desc: '',
      args: [projectName],
    );
  }

  /// `Open existing project`
  String get openExistingProject {
    return Intl.message(
      'Open existing project',
      name: 'openExistingProject',
      desc: '',
      args: [],
    );
  }

  /// `Project name`
  String get projectName {
    return Intl.message(
      'Project name',
      name: 'projectName',
      desc: '',
      args: [],
    );
  }

  /// `Project path`
  String get projectPath {
    return Intl.message(
      'Project path',
      name: 'projectPath',
      desc: '',
      args: [],
    );
  }

  /// `Project already exists, choose different name`
  String get projectExistsError {
    return Intl.message(
      'Project already exists, choose different name',
      name: 'projectExistsError',
      desc: '',
      args: [],
    );
  }

  /// `Organization`
  String get organization {
    return Intl.message(
      'Organization',
      name: 'organization',
      desc: '',
      args: [],
    );
  }

  /// `Check names before continue`
  String get checkNamesTitle {
    return Intl.message(
      'Check names before continue',
      name: 'checkNamesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Is project name\n`
  String get checkNamesContentFirstPart {
    return Intl.message(
      'Is project name\n',
      name: 'checkNamesContentFirstPart',
      desc: '',
      args: [],
    );
  }

  /// `\nand organization\n`
  String get checkNamesContentSecondPart {
    return Intl.message(
      '\nand organization\n',
      name: 'checkNamesContentSecondPart',
      desc: '',
      args: [],
    );
  }

  /// `\nlooking reasonable?`
  String get checkNamesContentLastPart {
    return Intl.message(
      '\nlooking reasonable?',
      name: 'checkNamesContentLastPart',
      desc: '',
      args: [],
    );
  }

  /// `Path not selected`
  String get pathNotSelectedTitle {
    return Intl.message(
      'Path not selected',
      name: 'pathNotSelectedTitle',
      desc: '',
      args: [],
    );
  }

  /// `You must select path to projects folder`
  String get pathNotSelectedContent {
    return Intl.message(
      'You must select path to projects folder',
      name: 'pathNotSelectedContent',
      desc: '',
      args: [],
    );
  }

  /// `New version available`
  String get newVersionAvailableTitle {
    return Intl.message(
      'New version available',
      name: 'newVersionAvailableTitle',
      desc: '',
      args: [],
    );
  }

  /// `New version of Onix Flutter Project Generator is available. Do you want to download it?`
  String get newVersionAvailableContent {
    return Intl.message(
      'New version of Onix Flutter Project Generator is available. Do you want to download it?',
      name: 'newVersionAvailableContent',
      desc: '',
      args: [],
    );
  }

  /// `Add screen`
  String get addScreen {
    return Intl.message(
      'Add screen',
      name: 'addScreen',
      desc: '',
      args: [],
    );
  }

  /// `Modify screen`
  String get modifyScreen {
    return Intl.message(
      'Modify screen',
      name: 'modifyScreen',
      desc: '',
      args: [],
    );
  }

  /// `Already exists`
  String get screenAlreadyExistsTitle {
    return Intl.message(
      'Already exists',
      name: 'screenAlreadyExistsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Screen with such name already exists`
  String get screenAlreadyExistsContent {
    return Intl.message(
      'Screen with such name already exists',
      name: 'screenAlreadyExistsContent',
      desc: '',
      args: [],
    );
  }

  /// `Screen name`
  String get screenName {
    return Intl.message(
      'Screen name',
      name: 'screenName',
      desc: '',
      args: [],
    );
  }

  /// `Screens`
  String get screens {
    return Intl.message(
      'Screens',
      name: 'screens',
      desc: '',
      args: [],
    );
  }

  /// `State manager`
  String get stateManager {
    return Intl.message(
      'State manager',
      name: 'stateManager',
      desc: '',
      args: [],
    );
  }

  /// `Using BLoC`
  String get usingBloc {
    return Intl.message(
      'Using BLoC',
      name: 'usingBloc',
      desc: '',
      args: [],
    );
  }

  /// `Using Cubit`
  String get usingCubit {
    return Intl.message(
      'Using Cubit',
      name: 'usingCubit',
      desc: '',
      args: [],
    );
  }

  /// `Actions`
  String get actions {
    return Intl.message(
      'Actions',
      name: 'actions',
      desc: '',
      args: [],
    );
  }

  /// `Integrate Device Preview?`
  String get integrateDevicePreview {
    return Intl.message(
      'Integrate Device Preview?',
      name: 'integrateDevicePreview',
      desc: '',
      args: [],
    );
  }

  /// `Theming`
  String get theming {
    return Intl.message(
      'Theming',
      name: 'theming',
      desc: '',
      args: [],
    );
  }

  /// `Localization:`
  String get localization {
    return Intl.message(
      'Localization:',
      name: 'localization',
      desc: '',
      args: [],
    );
  }

  /// `Router:`
  String get router {
    return Intl.message(
      'Router:',
      name: 'router',
      desc: '',
      args: [],
    );
  }

  /// `Will you use Sonar?`
  String get useSonar {
    return Intl.message(
      'Will you use Sonar?',
      name: 'useSonar',
      desc: '',
      args: [],
    );
  }

  /// `Integrate Firebase with FirebaseAuth?`
  String get firebaseAuth {
    return Intl.message(
      'Integrate Firebase with FirebaseAuth?',
      name: 'firebaseAuth',
      desc: '',
      args: [],
    );
  }

  /// `Integrate GraphQL?`
  String get integrateGraphQl {
    return Intl.message(
      'Integrate GraphQL?',
      name: 'integrateGraphQl',
      desc: '',
      args: [],
    );
  }

  /// `Generate Sonar config?`
  String get generateSonarConfig {
    return Intl.message(
      'Generate Sonar config?',
      name: 'generateSonarConfig',
      desc: '',
      args: [],
    );
  }

  /// `Modify signing vars...`
  String get modifySigningVars {
    return Intl.message(
      'Modify signing vars...',
      name: 'modifySigningVars',
      desc: '',
      args: [],
    );
  }

  /// `(Dialog will open in separate window)`
  String get dialogWillOpenInSeparateWindow {
    return Intl.message(
      '(Dialog will open in separate window)',
      name: 'dialogWillOpenInSeparateWindow',
      desc: '',
      args: [],
    );
  }

  /// `Generate signing key?`
  String get generateSigningKey {
    return Intl.message(
      'Generate signing key?',
      name: 'generateSigningKey',
      desc: '',
      args: [],
    );
  }

  /// `(space separated)`
  String get spaceSeparated {
    return Intl.message(
      '(space separated)',
      name: 'spaceSeparated',
      desc: '',
      args: [],
    );
  }

  /// `Add flavors:`
  String get addFlavors {
    return Intl.message(
      'Add flavors:',
      name: 'addFlavors',
      desc: '',
      args: [],
    );
  }

  /// `Flavorize?`
  String get flavorize {
    return Intl.message(
      'Flavorize?',
      name: 'flavorize',
      desc: '',
      args: [],
    );
  }

  /// `DEV & PROD flavors will be added automatically`
  String get willBeAddedAutomatically {
    return Intl.message(
      'DEV & PROD flavors will be added automatically',
      name: 'willBeAddedAutomatically',
      desc: '',
      args: [],
    );
  }

  /// ` Keystore password`
  String get keystorePassword {
    return Intl.message(
      ' Keystore password',
      name: 'keystorePassword',
      desc: '',
      args: [],
    );
  }

  /// ` Two-letter country code`
  String get twoLetterCountryCode {
    return Intl.message(
      ' Two-letter country code',
      name: 'twoLetterCountryCode',
      desc: '',
      args: [],
    );
  }

  /// ` State or Province`
  String get stateOrProvince {
    return Intl.message(
      ' State or Province',
      name: 'stateOrProvince',
      desc: '',
      args: [],
    );
  }

  /// ` City or Locality`
  String get cityOrLocality {
    return Intl.message(
      ' City or Locality',
      name: 'cityOrLocality',
      desc: '',
      args: [],
    );
  }

  /// ` Organizational unit`
  String get organizationalUnit {
    return Intl.message(
      ' Organizational unit',
      name: 'organizationalUnit',
      desc: '',
      args: [],
    );
  }

  /// ` First & last name`
  String get firstLastName {
    return Intl.message(
      ' First & last name',
      name: 'firstLastName',
      desc: '',
      args: [],
    );
  }

  /// `Signing vars`
  String get signingVars {
    return Intl.message(
      'Signing vars',
      name: 'signingVars',
      desc: '',
      args: [],
    );
  }

  /// `URL`
  String get url {
    return Intl.message(
      'URL',
      name: 'url',
      desc: '',
      args: [],
    );
  }

  /// `Paste swagger config json file URL here to get data components from API\nor leave it empty to use default config`
  String get swaggerParserPrompt {
    return Intl.message(
      'Paste swagger config json file URL here to get data components from API\nor leave it empty to use default config',
      name: 'swaggerParserPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Generate`
  String get generate {
    return Intl.message(
      'Generate',
      name: 'generate',
      desc: '',
      args: [],
    );
  }

  /// `Request`
  String get request {
    return Intl.message(
      'Request',
      name: 'request',
      desc: '',
      args: [],
    );
  }

  /// `Response`
  String get response {
    return Intl.message(
      'Response',
      name: 'response',
      desc: '',
      args: [],
    );
  }

  /// `Data component`
  String get dataComponent {
    return Intl.message(
      'Data component',
      name: 'dataComponent',
      desc: '',
      args: [],
    );
  }

  /// `Data components`
  String get dataComponents {
    return Intl.message(
      'Data components',
      name: 'dataComponents',
      desc: '',
      args: [],
    );
  }

  /// `Add component`
  String get addComponent {
    return Intl.message(
      'Add component',
      name: 'addComponent',
      desc: '',
      args: [],
    );
  }

  /// `Add source`
  String get addSource {
    return Intl.message(
      'Add source',
      name: 'addSource',
      desc: '',
      args: [],
    );
  }

  /// `Modify source`
  String get modifySource {
    return Intl.message(
      'Modify source',
      name: 'modifySource',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get goBack {
    return Intl.message(
      'Back',
      name: 'goBack',
      desc: '',
      args: [],
    );
  }

  /// `Modify component`
  String get modifyComponent {
    return Intl.message(
      'Modify component',
      name: 'modifyComponent',
      desc: '',
      args: [],
    );
  }

  /// `Component name`
  String get componentNamePlaceholder {
    return Intl.message(
      'Component name',
      name: 'componentNamePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Create request?`
  String get createRequestCheckboxLabel {
    return Intl.message(
      'Create request?',
      name: 'createRequestCheckboxLabel',
      desc: '',
      args: [],
    );
  }

  /// `Create response?`
  String get createResponseCheckboxLabel {
    return Intl.message(
      'Create response?',
      name: 'createResponseCheckboxLabel',
      desc: '',
      args: [],
    );
  }

  /// `Standalone data components:`
  String get standaloneDataComponents {
    return Intl.message(
      'Standalone data components:',
      name: 'standaloneDataComponents',
      desc: '',
      args: [],
    );
  }

  /// `Source name`
  String get sourceNamePlaceholder {
    return Intl.message(
      'Source name',
      name: 'sourceNamePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Open in Android Studio`
  String get openInAndroidStudio {
    return Intl.message(
      'Open in Android Studio',
      name: 'openInAndroidStudio',
      desc: '',
      args: [],
    );
  }

  /// `Platforms`
  String get platforms {
    return Intl.message(
      'Platforms',
      name: 'platforms',
      desc: '',
      args: [],
    );
  }

  /// `Flavors`
  String get flavors {
    return Intl.message(
      'Flavors',
      name: 'flavors',
      desc: '',
      args: [],
    );
  }

  /// `Navigation router`
  String get navigationRouter {
    return Intl.message(
      'Navigation router',
      name: 'navigationRouter',
      desc: '',
      args: [],
    );
  }

  /// `Localization method`
  String get localizationMethod {
    return Intl.message(
      'Localization method',
      name: 'localizationMethod',
      desc: '',
      args: [],
    );
  }

  /// `Generate screens`
  String get generateScreens {
    return Intl.message(
      'Generate screens',
      name: 'generateScreens',
      desc: '',
      args: [],
    );
  }

  /// `Swagger URL`
  String get swaggerURL {
    return Intl.message(
      'Swagger URL',
      name: 'swaggerURL',
      desc: '',
      args: [],
    );
  }

  /// `Sources`
  String get sources {
    return Intl.message(
      'Sources',
      name: 'sources',
      desc: '',
      args: [],
    );
  }

  /// `Config file load error!`
  String get emptyConfigTitle {
    return Intl.message(
      'Config file load error!',
      name: 'emptyConfigTitle',
      desc: '',
      args: [],
    );
  }

  /// `Config file is not exists or not valid! Check is opened project was generated with Onix Flutter Project Generator`
  String get emptyConfigContent {
    return Intl.message(
      'Config file is not exists or not valid! Check is opened project was generated with Onix Flutter Project Generator',
      name: 'emptyConfigContent',
      desc: '',
      args: [],
    );
  }

  /// `Git permissions error!`
  String get gitPermissionsTitle {
    return Intl.message(
      'Git permissions error!',
      name: 'gitPermissionsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Git permissions error! Check is git installed and you have permissions to use it or try to add git key to apple keychain.`
  String get gitPermissionsContent {
    return Intl.message(
      'Git permissions error! Check is git installed and you have permissions to use it or try to add git key to apple keychain.',
      name: 'gitPermissionsContent',
      desc: '',
      args: [],
    );
  }

  /// `Also read this`
  String get alsoReadThis {
    return Intl.message(
      'Also read this',
      name: 'alsoReadThis',
      desc: '',
      args: [],
    );
  }

  /// `Get from swagger`
  String get getFromSwagger {
    return Intl.message(
      'Get from swagger',
      name: 'getFromSwagger',
      desc: '',
      args: [],
    );
  }

  /// `Place URL here`
  String get placeURLTitle {
    return Intl.message(
      'Place URL here',
      name: 'placeURLTitle',
      desc: '',
      args: [],
    );
  }

  /// `Leave blank to auto-gen...`
  String get keyStorePasswordPlaceholder {
    return Intl.message(
      'Leave blank to auto-gen...',
      name: 'keyStorePasswordPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Nullable`
  String get nullable {
    return Intl.message(
      'Nullable',
      name: 'nullable',
      desc: '',
      args: [],
    );
  }

  /// `List`
  String get list {
    return Intl.message(
      'List',
      name: 'list',
      desc: '',
      args: [],
    );
  }

  /// `Fields`
  String get fields {
    return Intl.message(
      'Fields',
      name: 'fields',
      desc: '',
      args: [],
    );
  }

  /// `Add field`
  String get addField {
    return Intl.message(
      'Add field',
      name: 'addField',
      desc: '',
      args: [],
    );
  }

  /// `Preview`
  String get preview {
    return Intl.message(
      'Preview',
      name: 'preview',
      desc: '',
      args: [],
    );
  }

  /// `{componentName} component preview`
  String componentPreview(Object componentName) {
    return Intl.message(
      '$componentName component preview',
      name: 'componentPreview',
      desc: '',
      args: [componentName],
    );
  }

  /// `Do you really want to delete source {sourceName}?`
  String sourceDeletingDialogTitle(Object sourceName) {
    return Intl.message(
      'Do you really want to delete source $sourceName?',
      name: 'sourceDeletingDialogTitle',
      desc: '',
      args: [sourceName],
    );
  }

  /// `With components`
  String get withComponents {
    return Intl.message(
      'With components',
      name: 'withComponents',
      desc: '',
      args: [],
    );
  }

  /// `Do you really want to delete component {componentName}?`
  String deleteComponentConfirmation(Object componentName) {
    return Intl.message(
      'Do you really want to delete component $componentName?',
      name: 'deleteComponentConfirmation',
      desc: '',
      args: [componentName],
    );
  }

  /// `{sourceName}Source already exists`
  String sourceExistsError(Object sourceName) {
    return Intl.message(
      '${sourceName}Source already exists',
      name: 'sourceExistsError',
      desc: '',
      args: [sourceName],
    );
  }

  /// `Data component {componentName} already exists`
  String dataComponentExistsError(Object componentName) {
    return Intl.message(
      'Data component $componentName already exists',
      name: 'dataComponentExistsError',
      desc: '',
      args: [componentName],
    );
  }

  /// ` in {sourceName} source`
  String dataComponentExistsInSource(Object sourceName) {
    return Intl.message(
      ' in $sourceName source',
      name: 'dataComponentExistsInSource',
      desc: '',
      args: [sourceName],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'uk'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

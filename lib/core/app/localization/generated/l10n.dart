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

  /// `Generate new project`
  String get generateNewProject {
    return Intl.message(
      'Generate new project',
      name: 'generateNewProject',
      desc: '',
      args: [],
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

  /// `Using BLoC`
  String get usingBloc {
    return Intl.message(
      'Using BLoC',
      name: 'usingBloc',
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

  /// `Theming:`
  String get theming {
    return Intl.message(
      'Theming:',
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
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
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

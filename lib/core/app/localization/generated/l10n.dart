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

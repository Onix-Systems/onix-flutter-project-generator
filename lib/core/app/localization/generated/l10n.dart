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

  /// `Arch Sample`
  String get appName {
    return Intl.message(
      'Arch Sample',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Arch Sample`
  String get title {
    return Intl.message(
      'Arch Sample',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `N/A`
  String get undefinedData {
    return Intl.message(
      'N/A',
      name: 'undefinedData',
      desc: '',
      args: [],
    );
  }

  /// `Image editor`
  String get commonImageEditor {
    return Intl.message(
      'Image editor',
      name: 'commonImageEditor',
      desc: '',
      args: [],
    );
  }

  /// `Select source`
  String get imageSource {
    return Intl.message(
      'Select source',
      name: 'imageSource',
      desc: '',
      args: [],
    );
  }

  /// `Gallery video`
  String get imageSourceVideoGalleryBtn {
    return Intl.message(
      'Gallery video',
      name: 'imageSourceVideoGalleryBtn',
      desc: '',
      args: [],
    );
  }

  /// `Camera video`
  String get imageSourceVideoCameraBtn {
    return Intl.message(
      'Camera video',
      name: 'imageSourceVideoCameraBtn',
      desc: '',
      args: [],
    );
  }

  /// `Gallery photo`
  String get imageSourceImageGalleryBtn {
    return Intl.message(
      'Gallery photo',
      name: 'imageSourceImageGalleryBtn',
      desc: '',
      args: [],
    );
  }

  /// `Camera photo`
  String get imageSourceImageCameraBtn {
    return Intl.message(
      'Camera photo',
      name: 'imageSourceImageCameraBtn',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get imageSourceCancelBtn {
    return Intl.message(
      'Cancel',
      name: 'imageSourceCancelBtn',
      desc: '',
      args: [],
    );
  }

  /// `Empty Field`
  String get errorEmptyField {
    return Intl.message(
      'Empty Field',
      name: 'errorEmptyField',
      desc: '',
      args: [],
    );
  }

  /// `Email not valid`
  String get errorEmail {
    return Intl.message(
      'Email not valid',
      name: 'errorEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password too short, should be 8 or more characters`
  String get errorPasswordToShort {
    return Intl.message(
      'Password too short, should be 8 or more characters',
      name: 'errorPasswordToShort',
      desc: '',
      args: [],
    );
  }

  /// `Password too long, should be less 20 characters`
  String get errorPasswordToLong {
    return Intl.message(
      'Password too long, should be less 20 characters',
      name: 'errorPasswordToLong',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one special character: !@#$%^&*()?<>`
  String get errorPasswordSpecialCharacter {
    return Intl.message(
      'Password must contain at least one special character: !@#\$%^&*()?<>',
      name: 'errorPasswordSpecialCharacter',
      desc: '',
      args: [],
    );
  }

  /// `Password should contain letters`
  String get errorPasswordLetters {
    return Intl.message(
      'Password should contain letters',
      name: 'errorPasswordLetters',
      desc: '',
      args: [],
    );
  }

  /// `Password should contain at least one number`
  String get errorPasswordNumeral {
    return Intl.message(
      'Password should contain at least one number',
      name: 'errorPasswordNumeral',
      desc: '',
      args: [],
    );
  }

  /// `Password and confirm password not match`
  String get errorPasswordNotMatch {
    return Intl.message(
      'Password and confirm password not match',
      name: 'errorPasswordNotMatch',
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

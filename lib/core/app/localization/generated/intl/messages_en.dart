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

  final messages = _notInlinedMessages(_notInlinedMessages);

  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "apiFailureNoNetwork": MessageLookupByLibrary.simpleMessage(
            "Sorry, we\'re having trouble connecting. Please check your internet connection and try again.\n\nReach out to support if you continue to experience issues."),
        "apiFailureTooManyRequests": MessageLookupByLibrary.simpleMessage(
            "Uh oh! Looks like we ran into an issue while processing this request. Please try again.\n\nReach out to support if you continue to experience issues."),
        "apiFailureUnAuthorized": MessageLookupByLibrary.simpleMessage(
            "The username or password you entered is incorrect."),
        "apiFailureUndefined": MessageLookupByLibrary.simpleMessage(
            "Uh oh! Looks like we ran into an issue while processing this request. Please try again.\n\nReach out to support if you continue to experience issues."),
        "appName": MessageLookupByLibrary.simpleMessage("Arch Sample"),
        "commonImageEditor":
            MessageLookupByLibrary.simpleMessage("Image editor"),
        "errorEmail": MessageLookupByLibrary.simpleMessage("Email not valid"),
        "errorEmptyField": MessageLookupByLibrary.simpleMessage("Empty Field"),
        "errorPasswordLetters": MessageLookupByLibrary.simpleMessage(
            "Password should contain letters"),
        "errorPasswordNotMatch": MessageLookupByLibrary.simpleMessage(
            "Password and confirm password not match"),
        "errorPasswordNumeral": MessageLookupByLibrary.simpleMessage(
            "Password should contain at least one number"),
        "errorPasswordSpecialCharacter": MessageLookupByLibrary.simpleMessage(
            "Password must contain at least one special character: !@#\$%^&*()?<>"),
        "errorPasswordToLong": MessageLookupByLibrary.simpleMessage(
            "Password too long, should be less 20 characters"),
        "errorPasswordToShort": MessageLookupByLibrary.simpleMessage(
            "Password too short, should be 8 or more characters"),
        "imageSource": MessageLookupByLibrary.simpleMessage("Select source"),
        "imageSourceCancelBtn": MessageLookupByLibrary.simpleMessage("Cancel"),
        "imageSourceImageCameraBtn":
            MessageLookupByLibrary.simpleMessage("Camera photo"),
        "imageSourceImageGalleryBtn":
            MessageLookupByLibrary.simpleMessage("Gallery photo"),
        "imageSourceVideoCameraBtn":
            MessageLookupByLibrary.simpleMessage("Camera video"),
        "imageSourceVideoGalleryBtn":
            MessageLookupByLibrary.simpleMessage("Gallery video"),
        "title": MessageLookupByLibrary.simpleMessage("Arch Sample"),
        "undefinedData": MessageLookupByLibrary.simpleMessage("N/A")
      };
}

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
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "checkNamesContentFirstPart":
            MessageLookupByLibrary.simpleMessage("Is project name\n"),
        "checkNamesContentLastPart":
            MessageLookupByLibrary.simpleMessage("\nlooking reasonable?"),
        "checkNamesContentSecondPart":
            MessageLookupByLibrary.simpleMessage("\nand organization\n"),
        "checkNamesTitle":
            MessageLookupByLibrary.simpleMessage("Check names before continue"),
        "continueLabel": MessageLookupByLibrary.simpleMessage("Continue"),
        "generateNewProject":
            MessageLookupByLibrary.simpleMessage("Generate new project"),
        "newVersionAvailableContent": MessageLookupByLibrary.simpleMessage(
            "New version of Onix Flutter Project Generator is available. Do you want to download it?"),
        "newVersionAvailableTitle":
            MessageLookupByLibrary.simpleMessage("New version available"),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "openExistingProject":
            MessageLookupByLibrary.simpleMessage("Open existing project"),
        "organization": MessageLookupByLibrary.simpleMessage("Organization"),
        "pathNotSelectedContent": MessageLookupByLibrary.simpleMessage(
            "You must select path to projects folder"),
        "pathNotSelectedTitle":
            MessageLookupByLibrary.simpleMessage("Path not selected"),
        "projectExistsError": MessageLookupByLibrary.simpleMessage(
            "Project already exists, choose different name"),
        "projectName": MessageLookupByLibrary.simpleMessage("Project name"),
        "title": MessageLookupByLibrary.simpleMessage(
            "Onix Flutter Project Generator")
      };
}

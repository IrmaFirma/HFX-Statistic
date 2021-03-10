import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:time_tracker/Components/PlatformAwareDialog.dart';

class PlatformExceptionAlertDialog extends PlatformAwareDialog {
  final String title;
  final FirebaseAuthException exception;

  PlatformExceptionAlertDialog({this.title, this.exception})
      : super(
      title: title, content: exception.message, defaultActionText: 'OK');

  static String message(FirebaseAuthException exception) {
    if (exception is FirebaseException) {
      return exception.message;
    }
    return exception.toString();
  }
}
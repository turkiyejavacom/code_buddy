import 'package:flutter/material.dart';

abstract class Languages {

  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get logIn;
  String get register;
  String get signInWithGoogle;
  String get signInWithGithub;
  String get signUpWithGoogle;
  String get signUpWithGithub;
}
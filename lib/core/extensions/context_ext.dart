import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;

  // Mock l10n for the presentation
  AppLocalizations get l10n => AppLocalizations();
}

class AppLocalizations {
  String get fileOne => '🇩🇪🇧🇷\n\n24 years old';
  String get fileTwo => 'Working now at: YOUTRUST Inc.';
  String get fileThree =>
      'Talk to me in German, English, Portuguese, Spanish or Japanese';
  String get hiIam => 'Hi, I am';
  String get lucasGoldner => 'Lucas Goldner ⚡️';
}

extension TextThemeExtensions on TextTheme {
  TextStyle get title => TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
        fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
      );
}

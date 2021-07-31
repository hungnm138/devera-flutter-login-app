import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_login_app/localization/app_localization.dart';

import 'package:flutter_login_app/main.dart';

/// Localization delegate that builds an [AppLocalization] instance
class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  /// Returns a list of the supported locales that must match the
  /// list of _supportedLocales_ in [LoginApp]
  @override
  bool isSupported(Locale locale) => ['en', 'it'].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) =>
      SynchronousFuture<AppLocalization>(AppLocalization(locale));

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalization> old) => false;
}

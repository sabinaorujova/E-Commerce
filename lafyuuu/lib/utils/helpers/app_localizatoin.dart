// app_localizations.dart

import 'package:flutter/material.dart';

class AppLocalizations {
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  String get productDetailTitle => 'Məhsul Detayı';
  String get addToCartButton => 'Səbətə Əlavə Et';
  String get productDescription => 'Məhsul Təsviri';
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'fr', 'az'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations();
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Translations {
  Translations(this.locale);

  final Locale locale;

  static Translations? of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Hello',
    },
    'lg': {
      'title': 'gyebaleko',
    },
    'es': {
      'title': 'Hola',
    },
  };

  String text(String key) {
    return _localizedValues[locale.languageCode]![key] ?? '** $key not found';
  }
}

class TranslationsDelegate extends LocalizationsDelegate<Translations> {
  const TranslationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'lg', 'es'].contains(locale.languageCode);

  @override
  Future<Translations> load(Locale locale) {
    return SynchronousFuture<Translations>(Translations(locale));
  }

  @override
  bool shouldReload(TranslationsDelegate old) => false;
}



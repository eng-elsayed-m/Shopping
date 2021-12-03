import 'package:flutter/material.dart';
import 'package:flutter_toolbox/flutter_toolbox.dart';
import 'package:provider/provider.dart';

const KEY_SELECTED_LOCALE = "KEY_SELECTED_LOCALE";

class LocaleProvider extends ChangeNotifier {
  static LocaleProvider of(BuildContext context, {bool listen = true}) =>
      Provider.of<LocaleProvider>(context, listen: listen);

  Locale _locale = Locale('ar');

  LocaleProvider() {
    init();
  }

  void init() async {
    final String? selectedLocaleLangCode =
        (await prefs()).getString(KEY_SELECTED_LOCALE);

    _locale = Locale(selectedLocaleLangCode ?? 'ar');
    notifyListeners();
  }

  void saveLocale(Locale locale) async {
    _locale = locale;

    notifyListeners();

    (await prefs()).setString(KEY_SELECTED_LOCALE, locale.languageCode);
  }

  Locale getLocale() => _locale;
}

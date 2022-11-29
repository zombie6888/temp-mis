import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class Translator extends ChangeNotifier {
  final BuildContext _context;
  Translator(this._context);

  String translate(String key, {Map<String, String>? translationParams}) {    
    return FlutterI18n.translate(_context, key,
        translationParams: translationParams);
  }

  void refresh(String language) async {    
    await FlutterI18n.refresh(_context, Locale(language));
    notifyListeners();
  }

  String plural(String key, int value) {    
    return FlutterI18n.plural(_context, key, value);
  }
}  
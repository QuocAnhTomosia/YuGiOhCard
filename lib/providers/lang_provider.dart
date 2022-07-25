import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageProvider {
 
  String current = "en";
  LanguageProvider({
    required this.current,
  });

  changeLanguage(String lang,BuildContext context) {
    current = lang;
    context.setLocale(Locale(current));
  }
}

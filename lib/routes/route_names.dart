import 'package:flutter/material.dart';
import 'package:yugi_oh_cards/views/search_view.dart';
import 'package:yugi_oh_cards/views/sign_up_view.dart';

import '../views/login_view.dart';
import '../views/home_page_view.dart';
import '../views/settings_view.dart';
import '../views/start_view.dart';

class NamedRouter {
  static Map<String, WidgetBuilder> routes = {
    '/':((context) => const StartView()),
          '/home_page':(context) => HomePageview(),
          '/login': (context) => LoginView(),
          '/search': ((context) => SearchWiew()),
          '/settings': ((context) => SettingsView()),
          '/sign_up':((context) =>  SignUpView()),
  };
}

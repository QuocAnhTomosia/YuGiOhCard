import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yugi_oh_cards/views/search_view.dart';
import 'package:yugi_oh_cards/views/settings_view.dart';
import 'package:yugi_oh_cards/views/start_view.dart';

import 'bloc/cards_searching_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        path: 'assets/translations',
        supportedLocales: const [
          Locale('en'),
          Locale('vi'),
          Locale('fr'),
        ],
        child: const YugiOh()),
  );
}

class YugiOh extends StatelessWidget {
  const YugiOh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CardsSearchingBloc>(
          create: (BuildContext context) => CardsSearchingBloc(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => StartView(),
          '/search': ((context) => SearchView()),
          '/settings':((context)=> SettingsView()),
        },
      ),
    );
  }
}

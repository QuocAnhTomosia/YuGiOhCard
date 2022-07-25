import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yugi_oh_cards/cubit/pass_visible_cubit.dart';
import 'package:yugi_oh_cards/routes/route_names.dart'; 

import 'bloc/cards_searching_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(); //
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
        BlocProvider<PassVisibleCubit>(
            create: (BuildContext context) => PassVisibleCubit()),
        BlocProvider<CardsSearchingBloc>(
          create: (BuildContext context) => CardsSearchingBloc(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
        routes: NamedRouter.routes,
      ),
    );
  }
}

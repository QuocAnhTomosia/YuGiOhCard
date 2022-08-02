import 'package:animations/animations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yugi_oh_cards/bloc/log_in/bloc/log_in_bloc.dart';
import 'package:yugi_oh_cards/bloc/log_in/bloc/log_in_state.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text(tr("settings"))),
      body: Column(
        children: <Widget>[
          OpenContainer(
              closedBuilder: (context, action) => SizedBox(
                    height: size.height * 0.1,
                    width: size.width,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          tr("language"),
                          style: const TextStyle(fontSize: 20),
                        )),
                  ),
              openBuilder: (context, action) => Scaffold(
                    appBar: AppBar(
                      title: Text(tr("language")),
                    ),
                    body: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            context.setLocale(const Locale("vi"));
                          },
                          child: SizedBox(
                              height: size.height * 0.08,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Tieng Viet"),
                                  Visibility(
                                      visible: tr("lang") == "vi",
                                      child: const Icon(Icons.check,
                                          color: Colors.blue))
                                ],
                              )),
                        ),
                        InkWell(
                          onTap: () {
                            context.setLocale(const Locale("en"));
                            // context.read<LangCubitCubit>().updateEn();
                          },
                          child: SizedBox(
                              height: size.height * 0.08,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("English"),
                                  Visibility(
                                      visible: tr("lang") == "en",
                                      child: const Icon(
                                        Icons.check,
                                        color: Colors.blue,
                                      ))
                                ],
                              )),
                        ),
                        InkWell(
                          onTap: () {
                            context.setLocale(const Locale("fr"));
                            // context.read<LangCubitCubit>().updateVi();
                          },
                          child: SizedBox(
                              height: size.height * 0.08,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("French"),
                                  Visibility(
                                      visible: tr("lang") == "fr",
                                      child: const Icon(Icons.check,
                                          color: Colors.blue))
                                ],
                              )),
                        ),
                      ],
                    ),
                  )),
          BlocListener<LogInBloc, LogInState>(
            listener: ((context, state) {
              if (state.status == LogInStatus.init) {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/log_in", (route) => false);
              }
            }),
            child: ElevatedButton(
              child: const Text("Log out"),
              onPressed: () {
                context.read<LogInBloc>().add(const LogInReset());
              },
            ),
          ),
        ],
      ),
    );
  }
}

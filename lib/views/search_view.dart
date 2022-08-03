import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:yugi_oh_cards/bloc/cards_searching/cards_searching_bloc.dart';
import 'package:yugi_oh_cards/bloc/log_in/bloc/log_in_bloc.dart';
import 'package:yugi_oh_cards/commons/card_display.dart';

import '../bloc/log_in/bloc/log_in_state.dart';

class SearchWiew extends StatelessWidget {
  SearchWiew({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    context.read<CardsSearchingBloc>().add( CardSearchingStarted());
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocListener<CardsSearchingBloc, CardsSearchingState>(
            listener: (context, state) {
              if (state is CardSearchingStarted) {
              } else if (state is CardSearchingLoading) {
              } else if (state is CardSearchingLoaded) {}
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.blue)),
              child: TextFormField(
                controller: _controller,
                textAlign: TextAlign.center,
                enableInteractiveSelection: false,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: tr("search_bar"),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              context.read<CardsSearchingBloc>().add(CardSearchingSubmit(
                  name: _controller.text, language: tr("lang")));
            },
            child: Text(tr("submit"))),
        Expanded(
          child: BlocBuilder<CardsSearchingBloc, CardsSearchingState>(
              builder: (context, state) {
            if (state is CardSearchingError) {
              return Column(
                children: [
                  Text(state.respone),
                ],
              );
            } else if (state is CardSearchingLoading) {
              return const SpinKitFadingCircle(
                color: Colors.blue,
                size: 50.0,
              );
            } else if (state is CardSearchingLoaded) {
              return SizedBox(
                height: size.height * 0.7,
                width: size.width,
                child: ListView.builder(
                    addAutomaticKeepAlives: false,
                    itemCount: state.data.length,
                    itemBuilder: (context, int index) => Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: BlocBuilder<LogInBloc, LogInState>(
                            builder: (context, logState) {
                              return CardDisplay(
                                  card: state.data[index],
                                  myUser: logState.myUser!);
                            },
                          ),
                        )),
              );
            } else {
              return const Text("Hello");
            }
          }),
        ),
      ],
    );
  }
}

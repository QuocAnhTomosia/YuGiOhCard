import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:yugi_oh_cards/bloc/cards_searching/cards_searching_bloc.dart';
import 'package:yugi_oh_cards/bloc/log_in/bloc/log_in_state.dart';

import '../bloc/log_in/bloc/log_in_bloc.dart';

class ShoppingView extends StatelessWidget {
  const ShoppingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              height: size.height * 0.7,
              child: BlocBuilder<LogInBloc, LogInState>(
                builder: (context, logInState) {
                  if (logInState.status == LogInStatus.success) {
                    context.read<CardsSearchingBloc>().add(
                        CardSearchingIdSubmit(
                            logInState.myUser!.orderList.keys.toList(),
                            tr("lang")));
                    return BlocBuilder<CardsSearchingBloc, CardsSearchingState>(
                        builder: (context, cardsState) {
                      if (cardsState is CardSearchingLoaded) {
                        return ListView.builder(
                          itemCount: cardsState.data.length,
                          itemBuilder: (context, index) {
                            return Image.network(
                                cardsState.data[index].image_url);
                          },
                        );
                      } else if (cardsState is CardSearchingError) {
                        return Text(cardsState.respone);
                      } else {
                        return const Center(
                          child: SpinKitFadingCircle(
                            color: Colors.blue,
                            size: 50.0,
                          ),
                        );
                      }
                    });
                  } else {
                    return const Center(
                          child: SpinKitFadingCircle(
                            color: Colors.blue,
                            size: 50.0,
                          ),
                        );
                  }
                },
              )),
          InkWell(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(0.8, 1),
                  colors: <Color>[
                    Color(0xff1f005c),
                    Color(0xff5b0060),
                    Color(0xff870160),
                    Color(0xffac255e),
                    Color(0xffca485c),
                    Color(0xffe16b5c),
                    Color(0xfff39060),
                    Color(0xffffb56b),
                  ], // Gradient from https://learnui.design/tools/gradient-generator.html
                  tileMode: TileMode.mirror,
                ),
              ),
              height: size.height * 0.08,
              width: size.width * 0.2,
              child: const Center(
                  child: Text(
                "Buy",
                style: TextStyle(fontSize: 23),
              )),
            ),
          ),
        ],
      ),
    );
  }
}

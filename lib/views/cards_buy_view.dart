import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:yugi_oh_cards/bloc/cards_searching/cards_searching_bloc.dart';
import 'package:yugi_oh_cards/commons/card_display.dart';
import 'package:yugi_oh_cards/commons/fade_widget.dart';

import '../bloc/log_in/bloc/log_in_bloc.dart';
import '../providers/data_provider.dart';

class CardsBuyViews extends StatelessWidget {
  const CardsBuyViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<CardsSearchingBloc, CardsSearchingState>(
        buildWhen: ((previous, current) {
      return previous != current;
    }), builder: ((context, state) {
      if (state is CardSearchingLoading) {
        return const Center(
          child: SpinKitFadingCircle(
            color: Colors.blue,
            size: 50.0,
          ),
        );
      }
      if (state is CardSearchingError) {
        return Text(state.respone);
      }
      if (state is CardSearchingLoaded) {
        return ListView.builder(
            itemCount: state.data.length,
            itemBuilder: ((context, index) {
              return FadeWidget(
                  childWidget: CardDisplay(
                      card: state.data[index],
                      myUser: context.read<LogInBloc>().state.myUser!));
            }));
      } else {
        return const Center(
          child: SpinKitFadingCircle(
            color: Colors.blue,
            size: 50.0,
          ),
        );
      }
    }));
  }
}

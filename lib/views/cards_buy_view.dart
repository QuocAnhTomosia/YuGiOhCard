import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:yugi_oh_cards/commons/card_display.dart';
import 'package:yugi_oh_cards/services/cards_api_services.dart';

class CardsBuyViews extends StatelessWidget {
  const CardsBuyViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (context, index) {
        return FutureBuilder<DataResponse>(
          future: CardApi().fetchData("", tr("lang")),
          builder: ((context, snapshot) {
            if (snapshot.hasError || !snapshot.hasData) {
              return const Center(
                child: SpinKitFadingCircle(
                  color: Colors.blue,
                  size: 50.0,
                ),
              );
            } else if (snapshot.hasData) {
              return CardDisplay(card: snapshot.data!.list[0]);
            } else {
              return const Text("dont know");
            }
          }),
        );
      },
    );
  }
}

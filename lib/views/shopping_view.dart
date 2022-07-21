import 'package:flutter/material.dart';
import 'package:yugi_oh_cards/commons/buy_card_display.dart';
import 'package:yugi_oh_cards/services/cards_api_services.dart';

class ShoppingView extends StatelessWidget {
  const ShoppingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DataResponse>(
      future: CardApi().fetchData("Dark Magician", "en"),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("snapshots has some error");
        } else if (!snapshot.hasData) {
          return const Text('snapshots dont have data');
        } else if (snapshot.hasData) {
          return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
            return BuyCard(card: snapshot.data!.list[index]);
          });
        } else {
          return const Text("data");
        }
      },
    );
  }
}

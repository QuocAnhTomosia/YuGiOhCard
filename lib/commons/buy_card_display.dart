import 'package:flutter/material.dart';

import 'package:yugi_oh_cards/models/card_model.dart';

class BuyCard extends StatelessWidget {
  final YugiOhCard card;
  const BuyCard({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: size.width * 0.45,
          height: size.width * 0.45 * 1.4,
          child: Image.network(
            card.image_url,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: size.width * 0.45 * 1.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)),
                  height: size.height * 0.08,
                  width: size.width * 0.37,
                  child: Text(card.name)),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)),
                  child: Text("Price: ${card.card_prices}")),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Row(
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                    const Text("0"),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.add))
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

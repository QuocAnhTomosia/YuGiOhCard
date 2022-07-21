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
          width: size.width * 0.3,
          height: size.width * 0.3 * 1.4,
          child: Image.network(
            card.image_url,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: size.width * 0.3 * 1.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(card.name),
              Text(card.card_prices),
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                  const Text("0"),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.add))
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

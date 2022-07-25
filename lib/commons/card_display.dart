import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:yugi_oh_cards/models/card_model.dart';

class CardDisplay extends StatelessWidget {
  final YugiOhCard card;
  const CardDisplay({Key? key, required this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        const Divider(
          thickness: 1,
          color: Colors.black,
        ),
        OpenContainer(
          closedBuilder: (context, action) => (SizedBox(
            width: size.width * 0.7,
            height: size.width * 0.7 * 1.4,
            child: Image.network(
              card.image_url,
              fit: BoxFit.fill,
            ),
          )),
          openBuilder: (BuildContext context,
              void Function({Object? returnValue}) action) {
            return Scaffold(
              appBar: AppBar(title: Text(card.name)),
              body: Center(
                child: Column(children: [
                  SizedBox(
                    width: size.width * 0.7,
                    height: size.width * 0.7 * 1.4,
                    child: Image.network(
                      card.image_url,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: size.width,
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent)),
                        child: Text("Description: ${card.desc}")),
                  ),
                  SizedBox(
                    child: Text("Price: ${card.card_prices}"),
                  ),
                ]),
              ),
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ElevatedButton(
                  onPressed: () {}, child: const Icon(Icons.shopping_basket)),
            ),
            const FavoriteChange(),
          ],
        )
      ],
    );
  }
}

class FavoriteChange extends StatefulWidget {
  const FavoriteChange({Key? key}) : super(key: key);

  @override
  State<FavoriteChange> createState() => _FavoriteChangeState();
}

class _FavoriteChangeState extends State<FavoriteChange> {
  bool status = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.white, onPrimary: Colors.blue),
          onPressed: () {
            setState(() {
              status = !status;
            });
          },
          child: status
              ? const Icon(
                  Icons.favorite_outline,
                  color: Colors.red,
                )
              : const Icon(
                  Icons.favorite,
                  color: Colors.red,
                )),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:yugi_oh_cards/bloc/cards_searching_bloc.dart';
import 'package:yugi_oh_cards/commons/card_display.dart';
import 'package:yugi_oh_cards/views/favourite_view.dart';
import 'package:yugi_oh_cards/views/shopping_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  int _selectedIndex = 0;
  bool isSwitched = false;
  final List<Widget> _widgetOptions = [
    SearchWidget(),
    FavoriteWidget(),
    ShoppingView(),
    //SettingsView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> _tittleOptions = [
      tr("search_title"),
      tr("favorite"),
      "shopping",
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.search),
              label: tr("search_icon"),
            ),
            BottomNavigationBarItem(
                icon: const Icon(Icons.favorite), label: tr("favorite")),
            // BottomNavigationBarItem(
            // icon: const Icon(Icons.shopping_bag), label: "shopping"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag), label: "shopping"),
          ]),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/settings");
              },
              icon: Icon(Icons.settings))
        ],
        title: Text(_tittleOptions.elementAt(_selectedIndex)),
      ),
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  SearchWidget({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                          child: CardDisplay(card: state.data[index]),
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

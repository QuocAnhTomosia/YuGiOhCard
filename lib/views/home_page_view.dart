import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yugi_oh_cards/views/favourite_view.dart';
import 'package:yugi_oh_cards/views/search_view.dart';
import 'package:yugi_oh_cards/views/shopping_view.dart';

class HomePageview extends StatefulWidget {
  const HomePageview({Key? key}) : super(key: key);

  @override
  State<HomePageview> createState() => _HomePageviewState();
}

class _HomePageviewState extends State<HomePageview> {
  int _selectedIndex = 0;
  bool isSwitched = false;
  final List<Widget> _widgetOptions = [
    SearchWiew(),
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
      tr("shopping"),
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
            BottomNavigationBarItem(
                icon: const Icon(Icons.shopping_bag), label: tr("shopping")),
          ]),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/settings");
              },
              icon: const Icon(Icons.settings))
        ],
        title: Text(_tittleOptions.elementAt(_selectedIndex)),
      ),
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}

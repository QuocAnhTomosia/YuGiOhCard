import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yugi_oh_cards/views/cards_buy_view.dart';
import 'package:yugi_oh_cards/views/favourite_view.dart';
import 'package:yugi_oh_cards/views/search_view.dart';
import 'package:yugi_oh_cards/views/shopping_view.dart';

// Khong modify constant de cho easy localize rebuild
class HomePageview extends StatefulWidget {
  const HomePageview({Key? key}) : super(key: key);

  @override
  State<HomePageview> createState() => _HomePageviewState();
}

class _HomePageviewState extends State<HomePageview> {
  int _selectedIndex = 0;
  bool isSwitched = false;
  final List<Widget> _widgetOptions = [
     CardsBuyViews(),
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
      tr('home'),
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
              activeIcon: const Icon(Icons.home, color: Colors.orange),
              icon: const Icon(Icons.home, color: Colors.grey),
              label: tr("home"),
            ),
            BottomNavigationBarItem(
              activeIcon: const Icon(Icons.search, color: Colors.orange),
              icon: const Icon(Icons.search, color: Colors.grey),
              label: tr("search_icon"),
            ),
            BottomNavigationBarItem(activeIcon: const Icon(Icons.favorite, color: Colors.orange),
                icon: const Icon(Icons.favorite, color: Colors.grey),
                label: tr("favorite")),
          
            BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_bag, color: Colors.grey),
              label: tr("shopping"),
              activeIcon: const Icon(Icons.shopping_bag, color: Colors.orange),
            ),
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

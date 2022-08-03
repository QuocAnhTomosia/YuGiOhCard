import 'package:flutter/material.dart';
import 'package:yugi_oh_cards/models/card_model.dart';

class DataProvider with ChangeNotifier {
  late List<List<YugiOhCard>> _data;
  DataProvider() {
    _data = [[], [], [], []];
  }

  addData(List<YugiOhCard> data, int page) {
    _data[page] = data;
    notifyListeners();
  }

  List<YugiOhCard> get(int page) {return _data[page];}
}

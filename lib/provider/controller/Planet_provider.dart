
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../../modals/planet_model.dart';

class PlanetProvider extends ChangeNotifier{
  String? data;
  List<Planet_Model> Planet = [];




  Future<void> FormJson() async {
    data = await rootBundle.loadString("assets/json/planet.json");
    List decodeList = jsonDecode(data!) ;
    Planet =
        decodeList.map((e) => Planet_Model.frommap(data: e)).toList();
    notifyListeners();

  }

  List<int> _favorites = [];

  List<int> get favorites => _favorites;

  void addToFavorites(int index) {
  if (!_favorites.contains(index)) {
  _favorites.add(index);
  notifyListeners();
  }
  }
}
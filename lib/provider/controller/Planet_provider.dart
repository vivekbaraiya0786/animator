
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  falseToTrue({required int i}) async {
    Planet[i].favourite = true;
  }
  trueToFalse({required int i}) async {
    Planet[i].favourite = false;
  }
}

class Favourite_Provider with ChangeNotifier {
  List<Planet_Model> favourite = [];

  // Rest of the code...

   addToFavourite({required Planet_Model added}) async {
    favourite.add(added);

    SharedPreferences preferences = await SharedPreferences.getInstance();

    // await preferences.setStringList('favourite', favourite.map((planet) => planet.toJson()).toList());

    notifyListeners();
  }

   removeToFavourite({required Planet_Model added}) async {
    favourite.remove(added);

    SharedPreferences preferences = await SharedPreferences.getInstance();

    // await preferences.setStringList('favourite', favourite.map((planet) => planet.toJson()).toList());

    notifyListeners();
  }
}

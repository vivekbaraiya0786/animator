import 'package:animator/provider/controller/Planet_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: ListView(
        children: [
          ListTile(
          ),
        ],
      ),
    );
  }
}

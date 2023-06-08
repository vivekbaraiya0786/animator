import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/controller/Planet_provider.dart';
import 'Theme_provider.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Favourite_Provider favouriteTrue = Provider.of(context);
    Favourite_Provider favouriteFalse = Provider.of(context, listen: false);
    return Scaffold(
      body: (Provider.of<Favourite_Provider>(context).favourite.isEmpty)
          ? Container(

        decoration:  BoxDecoration(
            gradient: (Provider.of<ChangeThemeProvider>(context,
                listen: true)
                .changethemeModel
                .isDark)
                ?LinearGradient(
              colors: [
                Color(0xff130320),
                Color(0xff2a0d2b),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            )
                :LinearGradient(
              colors: [
                Colors.white,
                Colors.black12,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            )),
            child: Center(
                child: Center(
                child: Text('No favorite planets yet.'),
              )),
          )
          : Container(
        decoration:  BoxDecoration(
            gradient: (Provider.of<ChangeThemeProvider>(context,
                listen: true)
                .changethemeModel
                .isDark)
                ?LinearGradient(
              colors: [
                Color(0xff130320),
                Color(0xff2a0d2b),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            )
                :LinearGradient(
              colors: [
                Colors.white,
                Colors.black12,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            )),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount:
                      Provider.of<Favourite_Provider>(context).favourite.length,
                  itemBuilder: (context, index) {
                    return Card(
                      borderOnForeground: true,
                      color: (Provider.of<ChangeThemeProvider>(context,
                          listen: true)
                          .changethemeModel
                          .isDark)
                        ?Color(0xff2a0d2b)
                        :Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: ListTile(
                          leading: RotationTransition(
                              turns: animationController,
                              child: Image.asset(
                                  "${Provider.of<Favourite_Provider>(context).favourite[index].image}",
                                  height: 100)),
                          title: Text(
                              "${Provider.of<Favourite_Provider>(context).favourite[index].name1}  PLANET "),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(CupertinoIcons.heart),
                          ),
                        ),
                      ),
                    );
                  },
                ),
            ),
          ),
    );
  }
}

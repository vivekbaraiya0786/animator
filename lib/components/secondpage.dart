import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modals/planet_model.dart';
import '../provider/controller/Planet_provider.dart';
import 'Theme_provider.dart';
import 'favourite_page.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  int selectedIndex = 1;
  int selectedIndex1 = 1;



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
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Favourite_Provider favouriteTrue = Provider.of(context);
    Favourite_Provider favouriteFalse = Provider.of(context,listen: false);

    Size size = MediaQuery.of(context).size;
    double _height = size.height;
    double _width = size.width;
    int data = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: _width * 1,
          height: _height * 1,
          decoration: BoxDecoration(
              gradient: (Provider.of<ChangeThemeProvider>(context, listen: true)
                      .changethemeModel
                      .isDark)
                  ? const LinearGradient(
                      colors: [
                        Color(0xff130320),
                        Color(0xff2a0d2b),
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    )
                  : const LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.black12,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    )),
          child: Padding(
            padding: EdgeInsets.all(_height * 0.015),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.keyboard_arrow_left,
                            size: 35,
                          )),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.more_vert,
                            size: 27,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: _height * 0.015,
                  ),
                  AnimatedBuilder(
                    animation: animationController,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: animationController.value * 2 * pi,
                        child: Image.asset(
                          Provider.of<PlanetProvider>(context)
                              .Planet[data]
                              .image,
                        ),
                      );
                    },
                  ),
                  // Image.asset("${Provider.of<PlanetProvider>(context).Planet[data].image}"),
                  SizedBox(
                    height: _height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                              Provider.of<PlanetProvider>(context)
                                  .Planet[data]
                                  .name1,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              )),
                          SizedBox(
                            width: _width * 0.03,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              bottom: 8,
                            ),
                            child: Text(
                              "PLANET",
                              style: TextStyle(fontSize: 14),
                            ),
                          )
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          Planet_Model planet = Provider.of<PlanetProvider>(context, listen: false).Planet[data];
                          if (favouriteFalse.favourite.contains(planet)) {
                            favouriteFalse.removeToFavourite(added: planet);
                          } else {
                            favouriteFalse.addToFavourite(added: planet);
                          }
                        },
                        icon: Consumer<PlanetProvider>(
                          builder: (context, planetProvider, _) {
                            bool isFavorite = planetProvider.Planet.contains(planetProvider.Planet[data]);
                            return Icon(
                              CupertinoIcons.heart_fill,
                              color: isFavorite ? CupertinoColors.destructiveRed : CupertinoColors.white,
                            );
                          },
                        ),
                      ),
                      // IconButton(
                      //   onPressed: (){
                      //     // data.favourite = !data.favourite;
                      //     // setState(() {});
                      //     // if(data.favourite == true)
                      //     // {
                      //     //   Provider.of<PlanetProvider>(context,listen: false).falseToTrue(i: data.id);
                      //     // } else{
                      //     //   Provider.of<PlanetProvider>(context,listen: false).Planet[data.id].favourite = false;
                      //     // }
                      //     // if(data.favourite == true)
                      //     // {
                      //     //   Provider.of<Favourite_Provider>(context,listen: false).addToFavourite(added: data);
                      //     // }
                      //     favouriteFalse.addToFavourite(added: Provider.of<PlanetProvider>(context,listen: false).Planet[data]);
                      //   },
                      //   icon: Icon(
                      //     CupertinoIcons.heart_fill,
                      //     // color: (data.favourite == false)?CupertinoColors.white:CupertinoColors.destructiveRed,
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: _height * 0.02,
                  ),
                  Scrollbar(
                    radius: const Radius.circular(20),
                    thickness: 2,
                    // thumbVisibility: true,
                    controller: ScrollController(),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              left: 10,
                              right: 15,
                              bottom: 25,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Equatorial Diameter",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: _height * 0.01,
                                ),
                                Text(
                                  Provider.of<PlanetProvider>(context)
                                      .Planet[data]
                                      .EquatorialDiameter,
                                  style: TextStyle(
                                      color: Colors.pink.withOpacity(0.8),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              left: 10,
                              right: 15,
                              bottom: 25,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Mass",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: _height * 0.01,
                                ),
                                Text(
                                  Provider.of<PlanetProvider>(context)
                                      .Planet[data]
                                      .Mass,
                                  style: TextStyle(
                                    color: Colors.pink.withOpacity(0.8),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              left: 10,
                              right: 15,
                              bottom: 25,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Rotation Period",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: _height * 0.01,
                                ),
                                Text(
                                  Provider.of<PlanetProvider>(context)
                                      .Planet[data]
                                      .RotationPeriod,
                                  style: TextStyle(
                                    color: Colors.pink.withOpacity(0.8),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              left: 10,
                              right: 15,
                              bottom: 25,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Surface Temp",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: _height * 0.01,
                                ),
                                Text(
                                  Provider.of<PlanetProvider>(context)
                                      .Planet[data]
                                      .SurfaceTemp,
                                  style: TextStyle(
                                    color: Colors.pink.withOpacity(0.8),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 1;
                            });
                          },
                          child: Container(
                            width: 100,
                            height: 50,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: selectedIndex == 1
                                  ? Colors.pink.withOpacity(0.6)
                                  : Colors.white12.withOpacity(0),
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                colors: [
                                  Colors.pink,
                                  Colors.white,
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.bottomRight,
                                stops: [0.6, 0.99],
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'OverView',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 2;
                            });
                          },
                          child: Container(
                            width: 100,
                            height: 50,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: selectedIndex == 2
                                  ? Colors.pink.withOpacity(0.6)
                                  : Colors.white12.withOpacity(0),
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                colors: [
                                  Colors.pink,
                                  Colors.white,
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.bottomRight,
                                stops: [0.6, 0.99],
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'In Depth',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 3;
                            });
                          },
                          child: Container(
                            width: 150,
                            height: 50,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: selectedIndex == 3
                                  ? Colors.pink.withOpacity(0.6)
                                  : Colors.white12.withOpacity(0),
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                colors: [Colors.pink, Colors.white],
                                begin: Alignment.centerLeft,
                                end: Alignment.bottomRight,
                                stops: [0.6, 0.99],
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'By The Number',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  (selectedIndex == 1)
                      ? Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex1 = 1;
                                    });
                                  },
                                  child: Container(
                                    width: 110,
                                    height: 50,
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: selectedIndex1 == 1
                                          ? Colors.pink.withOpacity(0.6)
                                          : Colors.white12.withOpacity(0),
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: const LinearGradient(
                                        colors: [Colors.pink, Colors.white],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.bottomRight,
                                        stops: [0.6, 0.99],
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Galleries',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex1 = 2;
                                    });
                                  },
                                  child: Container(
                                    width: 100,
                                    height: 50,
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: selectedIndex1 == 2
                                          ? Colors.pink.withOpacity(0.6)
                                          : Colors.white12.withOpacity(0),
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: const LinearGradient(
                                        colors: [Colors.pink, Colors.white],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.bottomRight,
                                        stops: [0.6, 0.99],
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Exploration',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: _height * 0.015,
                            ),
                            Divider(
                              color: (Provider.of<ChangeThemeProvider>(context,
                                          listen: true)
                                      .changethemeModel
                                      .isDark)
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            SizedBox(
                              height: _height * 0.025,
                            ),
                            (selectedIndex1 == 1)
                                ? SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: _height * 0.02,
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                  height: _height * 0.12,
                                                  width: _width * 0.4,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white
                                                        .withOpacity(0.1),
                                                    border: Border.all(
                                                      width: _width * 0.004,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                        Provider.of<PlanetProvider>(
                                                                context)
                                                            .Planet[data]
                                                            .gallery1,
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: _height * 0.02,
                                                ),
                                                Container(
                                                  height: _height * 0.12,
                                                  width: _width * 0.4,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white
                                                        .withOpacity(0.1),
                                                    border: Border.all(
                                                      width: _width * 0.004,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      20,
                                                    ),
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                        Provider.of<PlanetProvider>(
                                                                context)
                                                            .Planet[data]
                                                            .gallery2,
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: _height * 0.02,
                                                ),
                                                Container(
                                                  height: _height * 0.12,
                                                  width: _width * 0.4,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white
                                                        .withOpacity(0.1),
                                                    border: Border.all(
                                                      width: _width * 0.004,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      20,
                                                    ),
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                        Provider.of<PlanetProvider>(
                                                                context)
                                                            .Planet[data]
                                                            .gallery3,
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: _height * 0.02,
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                  height: _height * 0.2,
                                                  width: _width * 0.4,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white
                                                        .withOpacity(0.1),
                                                    border: Border.all(
                                                      width: _width * 0.004,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      20,
                                                    ),
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                        Provider.of<PlanetProvider>(
                                                                context)
                                                            .Planet[data]
                                                            .gallery4,
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: _height * 0.02,
                                                ),
                                                Container(
                                                  height: _height * 0.2,
                                                  width: _width * 0.4,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white
                                                        .withOpacity(0.1),
                                                    border: Border.all(
                                                      width: _width * 0.004,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      20,
                                                    ),
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                        Provider.of<PlanetProvider>(
                                                                context)
                                                            .Planet[data]
                                                            .gallery5,
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(),
                            (selectedIndex1 == 2)
                                ? Card(
                                    color: Colors.white.withOpacity(0.1),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        Provider.of<PlanetProvider>(context)
                                            .Planet[data]
                                            .Exploration,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                        )
                      : Container(),
                  (selectedIndex == 2)
                      ? Column(
                          children: [
                            SizedBox(
                              height: _height * 0.01,
                            ),
                            Divider(
                              color: (Provider.of<ChangeThemeProvider>(context,
                                          listen: true)
                                      .changethemeModel
                                      .isDark)
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            SizedBox(
                              height: _height * 0.01,
                            ),
                            Card(
                              color: Colors.white.withOpacity(0.1),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  Provider.of<PlanetProvider>(context)
                                      .Planet[data]
                                      .indeapth,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  (selectedIndex == 3)
                      ? Column(
                          children: [
                            SizedBox(
                              height: _height * 0.01,
                            ),
                            Divider(
                              color: (Provider.of<ChangeThemeProvider>(context,
                                          listen: true)
                                      .changethemeModel
                                      .isDark)
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            SizedBox(
                              height: _height * 0.01,
                            ),
                            Card(
                              color: Colors.white.withOpacity(0.1),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: _width * 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Equatorial Diameter : ",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      SizedBox(
                                        height: _height * 0.01,
                                      ),
                                      Text(
                                        Provider.of<PlanetProvider>(context)
                                            .Planet[data]
                                            .EquatorialDiameter,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: _height * 0.03,
                                      ),
                                      const Text(
                                        "Mass : ",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: _height * 0.01,
                                      ),
                                      Text(
                                        Provider.of<PlanetProvider>(context)
                                            .Planet[data]
                                            .Mass,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: _height * 0.03,
                                      ),
                                      const Text(
                                        "Mean Dist.From Sun : ",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: _height * 0.01,
                                      ),
                                      Text(
                                        Provider.of<PlanetProvider>(context)
                                            .Planet[data]
                                            .MeanDistFromSun,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: _height * 0.03,
                                      ),
                                      const Text(
                                        "Rotation Period : ",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: _height * 0.01,
                                      ),
                                      Text(
                                        Provider.of<PlanetProvider>(context)
                                            .Planet[data]
                                            .RotationPeriod,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: _height * 0.03,
                                      ),
                                      const Text(
                                        "Solar orbit period : ",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: _height * 0.01,
                                      ),
                                      Text(
                                        Provider.of<PlanetProvider>(context)
                                            .Planet[data]
                                            .solarorbitperiod,
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(
                                        height: _height * 0.03,
                                      ),
                                      const Text("Surface gravity : ",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      SizedBox(
                                        height: _height * 0.01,
                                      ),
                                      Text(
                                        Provider.of<PlanetProvider>(context)
                                            .Planet[data]
                                            .surfacegravity,
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(
                                        height: _height * 0.03,
                                      ),
                                      const Text("Surface Temp : ",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      SizedBox(
                                        height: _height * 0.01,
                                      ),
                                      Text(
                                        Provider.of<PlanetProvider>(context)
                                            .Planet[data]
                                            .SurfaceTemp,
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(
                                        height: _height * 0.03,
                                      ),
                                      const Text(
                                        "Orbit Distance-km :",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: _height * 0.01,
                                      ),
                                      Text(
                                        Provider.of<PlanetProvider>(context)
                                            .Planet[data]
                                            .OrbitDistancekm,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: _height * 0.03,
                                      ),
                                      const Text(
                                        "Equatorial Radius-km :",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: _height * 0.01,
                                      ),
                                      Text(
                                        Provider.of<PlanetProvider>(context)
                                            .Planet[data]
                                            .EquatorialRadiuskm,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: _height * 0.03,
                                      ),
                                      const Text(
                                        "Volume(km3) :",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: _height * 0.01,
                                      ),
                                      Text(
                                        Provider.of<PlanetProvider>(context)
                                            .Planet[data]
                                            .Volume,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: _height * 0.03,
                                      ),
                                      const Text(
                                        "Density(g/cm3) :",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: _height * 0.01,
                                      ),
                                      Text(
                                        Provider.of<PlanetProvider>(context)
                                            .Planet[data]
                                            .Density,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: _height * 0.03,
                                      ),
                                      const Text(
                                        "Escape Velocity(km/h) :",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: _height * 0.01,
                                      ),
                                      Text(
                                        Provider.of<PlanetProvider>(context)
                                            .Planet[data]
                                            .EscapeVelocity,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: _height * 0.03,
                                      ),
                                      const Text(
                                        "Atmospheric Constituents :",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: _height * 0.01,
                                      ),
                                      Text(
                                        Provider.of<PlanetProvider>(context)
                                            .Planet[data]
                                            .AtmosphericConstituents,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: _height * 0.03,
                                      ),
                                      const Text(
                                        "Rings :",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: _height * 0.01,
                                      ),
                                      Text(
                                        Provider.of<PlanetProvider>(context)
                                            .Planet[data]
                                            .Rings,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

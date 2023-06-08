import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/controller/Planet_provider.dart';
import 'Theme_provider.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({Key? key}) : super(key: key);

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  double rotationAngle = 0.0;
  Timer? rotationTimer;

  @override
  void initState() {
    super.initState();
    getdata();
    startRotation();
  }

  getdata() async {
    await Provider.of<PlanetProvider>(context, listen: false).FormJson();
  }

  void startRotation() {
    rotationTimer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      setState(() {
        rotationAngle += 0.1;
      });
    });
  }

  @override
  void dispose() {
    rotationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _height = size.height;
    double _width = size.width;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Container(
          width: _width * 1,
          height: _height * 0.875,
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
            padding: EdgeInsets.all(_height * 0.015),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: _height * 0.03,
                ),
                const Text(
                  "Explore",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: _height * 0.01,
                ),
                const Text(
                  "Let's see what's in space",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: _height * 0.01,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = 0;
                          });
                        },
                        child: Container(
                          width: 100,
                          height: 50,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: selectedIndex == 0
                                  ? Colors.pink.withOpacity(0.6)
                                  : Colors.white12.withOpacity(0),
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                  colors: [Colors.pink, Colors.white],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.bottomRight,
                                  stops: [0.6, 0.99])),
                          child: const Center(
                            child: Text(
                              'Planets',
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
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                  colors: [Colors.pink, Colors.white],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.bottomRight,
                                  stops: [0.6, 0.99])),
                          child: const Center(
                            child: Text(
                              'Moons',
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
                                  colors: [Colors.pink, Colors.white],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.bottomRight,
                                  stops: [0.6, 0.99])),
                          child: const Center(
                            child: Text(
                              'Stars',
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
                          width: 100,
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
                                  stops: [0.6, 0.99])),
                          child: const Center(
                            child: Text(
                              'Universe',
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
                SizedBox(
                  height: _height * 0.01,
                ),
                (selectedIndex == 0)
                ? Expanded(
                  child: Consumer<PlanetProvider>(
                    builder: (context, planetProvider, _) {
                      return GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                        Provider.of<PlanetProvider>(context).Planet.length,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 25,
                          crossAxisSpacing: 20,
                          mainAxisExtent: 160,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed("second",arguments: index);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                border: Border.all(
                                     width: _width * 0.004,color: Colors.white),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex:4,
                                    child: TweenAnimationBuilder(
                                      duration: const Duration(seconds: 2),
                                      tween: Tween<double>(begin: 0, end: 2 * pi),
                                      child: Center(
                                        child: Image.asset(
                                          Provider.of<PlanetProvider>(context)
                                              .Planet[index]
                                              .image,
                                        ),
                                      ),
                                      builder: (BuildContext context, double value,
                                          Widget? widget) {
                                        return Transform.rotate(
                                          angle: rotationAngle,
                                          child: widget,
                                        );
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 10,
                                        left: 10,
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            Provider.of<PlanetProvider>(context)
                                                .Planet[index]
                                                .name,
                                            style: TextStyle(
                                              fontSize: 18,

                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          // IconButton(onPressed: () {
                                          //
                                          // }, icon: Icon(CupertinoIcons.heart_fill,color: Colors.red,))
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: _height*0.01,
                                  ),
                                  Expanded(
                                    flex:3,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 10,
                                        left: 10,
                                      ),
                                      child: Text(
                                        Provider.of<PlanetProvider>(context)
                                            .Planet[index]
                                            .details1,
                                        style: TextStyle(
                                          fontSize: 14,

                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                )
                    :Container()
              ],
            ),
          ),
        ),
        backgroundColor: (Provider.of<ChangeThemeProvider>(context,
            listen: true)
            .changethemeModel
            .isDark)
            ?Color(0xff2a0d2b)
            :Colors.white10,
      ),
    );
  }
}



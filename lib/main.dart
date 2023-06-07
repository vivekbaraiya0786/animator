
import 'package:animator/provider/controller/Planet_provider.dart';
import 'package:animator/utils/apptheme.dart';
import 'package:animator/views/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/Theme_provider.dart';
import 'components/favourite_page.dart';
import 'components/firstpage.dart';
import 'components/secondpage.dart';
import 'modals/theme_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool isdarktheme = prefs.getBool('isdark') ?? false;

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PlanetProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChangeThemeProvider(
            changethemeModel: ChangeThemeModel(isDark: isdarktheme),
          ),
        ),
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lighttheme,
          darkTheme: AppTheme.Darktheme,
          themeMode: (Provider.of<ChangeThemeProvider>(context)
              .changethemeModel
              .isDark ==
              false)
              ? ThemeMode.light
              : ThemeMode.dark,
          routes: {
            '/': (context) => const MyHomePage(),
            'first': (context) => const Firstpage(),
            'second': (context) => const SecondPage(),
            'favourite': (context) => const FavouritePage(),
          },
        );
      },
    ),
  );
}


// {
// "id": 9,
// "name": "Earth's Moon",
// "name1": "EARTH'S MOON",
// "image": "assets/images/earth_s_moon-removebg-preview (1).png",
// "Equatorial Diameter": "4,879 km",
// "Mass": "3.3 × 10^23 kg",
// "Mean Dist.From Sun": "60.3 M KM",
// "Rotation Period": "53 DAYS",
// "solar orbit period": "88 DAYS",
// "surface gravity": "3.7 M/S²",
// "Surface Temp": "167°C",
// "Temp-day": "473°C",
// "Temp-night": "-183°C",
// "Details1": "Moon is an astronomical body revolving around the earth in an orbit closer to earth.",
// "Orbit Distance-km": "382,500",
// "Equatorial Radius-km": "1,737.4",
// "Volume(km3)": "92.1958×1010 km3",
// "Density(g/cm3)": "21.4 g/cm3.",
// "Escape Velocity(km/h)": "",
// "Atmospheric Constituents": "0",
// "Rings": "No",
// "Gallery1": "assets/earth's moon/1.jpeg",
// "Gallery2": "assets/earth's moon/2.jpeg",
// "Gallery3": "assets/earth's moon/3.jpeg",
// "Gallery4": "assets/earth's moon/4.jpeg",
// "Gallery5": "assets/earth's moon/5.jpeg",
// "Exploration": "Earth's Moon is the only place beyond Earth where humans have set foot.The brightest and largest object in our night sky, the Moon makes Earth a more livable planet by moderating our home planet's wobble on its axis, leading to a relatively stable climate. It also causes tides, creating a rhythm that has guided humans for thousands of years. The Moon was likely formed after a Mars-sized body collided with Earth.\n\nEarth's Moon is the fifth largest of the 200+ moons orbiting planets in our solar system.\n\nEarth's only natural satellite is simply called \"the Moon\" because people didn't know other moons existed until Galileo Galilei discovered four moons orbiting Jupiter in 1610.\n\nNASA currently has three robotic spacecraft exploring the Moon – Lunar Reconnaissance Orbiter and the twin ARTEMIS spacecraft (not to be confused with NASA's new Artemis program to send astronauts back to the Moon).",
// "in-deapth": ""
// }


import 'package:animator/provider/controller/Planet_provider.dart';
import 'package:animator/utils/apptheme.dart';
import 'package:animator/views/screens/homepage.dart';
import 'package:animator/views/screens/spalsh_screen.dart';
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
          create: (context) => Favourite_Provider(),
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
          initialRoute: "/",
          routes: {
            '/': (context) => const MyHomePage(),
            'first': (context) => const Firstpage(),
            'second': (context) => const SecondPage(),
            'favourite': (context) =>  FavoritePage(),
            'splash_screen': (context) =>  splash_screen(),
          },
        );
      },
    ),
  );
}

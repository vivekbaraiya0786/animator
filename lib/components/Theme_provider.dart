import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../modals/theme_model.dart';

class ChangeThemeProvider extends ChangeNotifier{
  ChangeThemeModel changethemeModel;

  ChangeThemeProvider({required this.changethemeModel});

  chnageTheme()async{
    changethemeModel.isDark = !changethemeModel.isDark;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isdark', changethemeModel.isDark);
    notifyListeners();
  }
}
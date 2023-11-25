import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier
{
  ThemeMode appTheme = ThemeMode.dark;
  Locale applocale = Locale('ar');

  void ChangeTheme(ThemeMode newTheme)
  {
    if (appTheme==newTheme)
    {
      return;
    }
    appTheme=newTheme;
    notifyListeners();
  }
  void changeLocale(Locale newLocale){
    if(applocale==newLocale)
    {
      return;
    }
    applocale = newLocale;
    notifyListeners();
  }
}
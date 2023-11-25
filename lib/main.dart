import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:untitled20/Hadeth/HadethDetails.dart';
import 'package:untitled20/Quran/Sura_Detailes_Screen.dart';

import 'HomeScreen.dart';
import 'MyThem.dart';
import 'app_config_provider.dart';


void main()
{
  runApp(ChangeNotifierProvider<AppConfigProvider>(
    create: (context) => AppConfigProvider(),
    child: MyApp(),
  ),);
}
class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routName,
      routes: {
        HomeScreen.routName:(context)=>HomeScreen(),
        Sura_Detailes_Screen.routName:(context)=>Sura_Detailes_Screen(),
        Hadeth_Detailes_Screen.routName:(context)=>Hadeth_Detailes_Screen(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: provider.applocale,
      theme: MyThem.ligthMode,
      darkTheme: MyThem.DarkTheme,
      themeMode: provider.appTheme,
    );
  }
}
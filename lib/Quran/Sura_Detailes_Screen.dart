import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../MyThem.dart';
import '../app_config_provider.dart';
import 'item_sura_details.dart';
import 'item_sura_name.dart';

class Sura_Detailes_Screen extends StatefulWidget {
  static const String routName = 'Sura_Detailes_Screen';

  @override
  State<Sura_Detailes_Screen> createState() => _Sura_Detailes_ScreenState();
}

class _Sura_Detailes_ScreenState extends State<Sura_Detailes_Screen> {
  List<String> verses = [];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Args;
    if (verses.isEmpty) {
      loadfile(args.index);
    }
    return Stack(
      children: [
        provider.appTheme == ThemeMode.light
            ? Image.asset(
                'assets/images/background.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              )
            : Image.asset(
                'assets/images/dark_bg.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              '${args.name}',
              style: MyThem.ligthMode.textTheme.headline1,
            ),
          ),
          body: verses.length == 0
              ? Center(child: CircularProgressIndicator())
              : Container(
                  decoration: BoxDecoration(color: provider.appTheme == ThemeMode.light
                      ? MyThem.whiteColor
                      : MyThem.PrimaryDark,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                      vertical: MediaQuery.of(context).size.height * 0.08),
                  child: ListView.builder(
                    itemBuilder: ((context, index) {
                      return ItemSuraDetailes(
                        contant: verses[index],
                        index: index,
                      );
                    }),
                    itemCount: verses.length,
                  ),
                ),
        )
      ],
    );
  }

  void loadfile(int index) async {
    String contant =
        await rootBundle.loadString('assets/files/suar/${index + 1}.txt');
    List<String> lines = contant.split('\n');
    verses = lines;
    setState(() {});
  }
}

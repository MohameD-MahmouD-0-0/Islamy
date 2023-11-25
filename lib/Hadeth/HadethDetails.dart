import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled20/Hadeth/Hadeth.dart';
import 'package:untitled20/Hadeth/item_hadeth_details.dart';

import '../MyThem.dart';
import '../app_config_provider.dart';


class Hadeth_Detailes_Screen extends StatefulWidget {
  static const String routName = 'Hadeth_Detailes_Screen';

  @override
  State<Hadeth_Detailes_Screen> createState() => _Hadeth_Detailes_ScreenState();
}

class _Hadeth_Detailes_ScreenState extends State<Hadeth_Detailes_Screen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as HadthData;
    return Stack(children: [
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
            '${args.title}',
            style: MyThem.ligthMode.textTheme.headline1,
          ),
        ),
        body:
        Container(
          decoration: BoxDecoration(color: provider.appTheme == ThemeMode.light
              ? MyThem.whiteColor
              : MyThem.PrimaryDark,
              borderRadius: BorderRadius.all(Radius.circular(25))),
          margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.08),
          child: ListView.builder(itemBuilder: ((context,index){
            return ItemHadethDetailes(contant: args.content[index],);
          }),
            itemCount: args.content.length),
        ),

      )
    ],
    );
  }
 }
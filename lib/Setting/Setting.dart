import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../MyThem.dart';
import 'LanguageshowSheet.dart';
import 'SettingSheet.dart';
import '../app_config_provider.dart';

class Setting extends StatefulWidget {
  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<AppConfigProvider>(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Themeing',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: provider.appTheme==ThemeMode.light?MyThem.blackColor:MyThem.whiteColor),
            ),
          ),
          InkWell(
            onTap: (){
              showThemeBottomSheet();
            },
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.appTheme==ThemeMode.light?'Light':'Dark', style: Theme.of(context).textTheme.subtitle1),
                  Icon(Icons.arrow_drop_down,size: 20,color:  provider.appTheme==ThemeMode.light?MyThem.blackColor:MyThem.whiteColor,)
                ],
              ),
            ),

          ),
          InkWell(
            onTap: (){
              showModebottomSheet();
            },
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.applocale== Locale('en')? 'English':"العربيه",textAlign: TextAlign.start,style: Theme.of(context).textTheme.subtitle1),
                  Icon(Icons.arrow_drop_down,size: 20,color:  provider.appTheme==ThemeMode.light?MyThem.blackColor:MyThem.whiteColor,)
                ],
              ),
            ),

          ),
        ],
      ),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(context: context, builder: (context)=>SettingSheet() );
  }
  void showModebottomSheet() {
    showModalBottomSheet(context: context, builder: (context)=> LanguageSheet());
  }
}

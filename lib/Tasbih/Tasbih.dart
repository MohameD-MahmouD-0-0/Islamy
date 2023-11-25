import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled20/MyThem.dart';
import 'package:untitled20/app_config_provider.dart';

class Tasbih extends StatefulWidget {
  @override
  State<Tasbih> createState() => _TasbihState();
}

class _TasbihState extends State<Tasbih> {
  int sebhaCount = 0;

  List<String> TasbihList = [
    'سبحان الله ',
    'الحمد لله ',
    'لا اله الا الله',
    'الله اكبر',
  ];
  int index = 0;
  double routate=0;

  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<AppConfigProvider>(context);
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                  margin: EdgeInsets.only(
                    left: 30,
                  ),
                  child: provider.appTheme==ThemeMode.dark?Image.asset('assets/images/head_sebha_dark.png'):
                  Image.asset('assets/images/head_sebha_logo.png')),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .090, bottom: 26),
                child: GestureDetector(
                  onTap: () {
                    sebhaCount++;
                    routate+=3;
                    if (sebhaCount % 33 == 0) {
                      index++;
                    }
                    if (index == TasbihList.length) {
                      index = 0;
                    }
                    setState(() {});
                  },
                  child: Transform.rotate(angle: routate,
                  child:provider.appTheme==ThemeMode.dark? Image.asset('assets/images/body_sebha_dark.png'):
                  Image.asset('assets/images/body_sebha_logo.png')),
                ),
              )
            ],
          ),
          Text(
            'عدد التسبيحات',
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.center,
          ),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:provider.appTheme==ThemeMode.dark? MyThem.PrimaryDark:MyThem.PrimaryLight),
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              child: Text(
                '$sebhaCount',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              )),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  color: provider.appTheme==ThemeMode.dark?MyThem.YellowColor:MyThem.PrimaryLight),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: Text(
                TasbihList[index],
                style: Theme.of(context).textTheme.titleMedium,
              ))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:untitled20/Hadeth/Hadeth.dart';
import 'package:untitled20/Radio/Radio.dart';
import 'package:untitled20/Setting/Setting.dart';
import 'package:untitled20/Tasbih/Tasbih.dart';

import 'MyThem.dart';
import 'Quran/Quran.dart';
import 'app_config_provider.dart';


class HomeScreen extends StatefulWidget {
  static const String routName = 'Home';
  List<String> SuraName=["الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
    ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
    ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
    ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
    ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
    ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
    ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
    ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
    ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
    "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"];
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        provider.appTheme==ThemeMode.light?
        Image.asset(
          'assets/images/background.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ): Image.asset(
          'assets/images/dark_bg.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.app_title,
              style: provider.appTheme==ThemeMode.light?Theme.of(context).textTheme.titleMedium?.copyWith(color: MyThem.blackColor):
              Theme.of(context).textTheme.titleMedium?.copyWith(color: MyThem.whiteColor)
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
              currentIndex: selectedindex,
              onTap: (index) {
                selectedindex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    label: AppLocalizations.of(context)!.quran,

                    icon: ImageIcon(AssetImage('assets/images/quran.png'))),
                BottomNavigationBarItem(
                    label: AppLocalizations.of(context)!.hadeth,
                    icon: ImageIcon(AssetImage('assets/images/hadeth.png'))),
                BottomNavigationBarItem(
                    label: AppLocalizations.of(context)!.sebha,
                    icon: ImageIcon(AssetImage('assets/images/sebha.png'))),
                BottomNavigationBarItem(
                    label: AppLocalizations.of(context)!.radio,
                    icon: ImageIcon(AssetImage('assets/images/radio.png'))),
                BottomNavigationBarItem(
                    label: AppLocalizations.of(context)!.setting,
                    icon: Icon(Icons.settings)),
              ],
            ),
          ),
          body: pages[selectedindex],
        ),
    ],
    );
  }

   List<Widget> pages = [Quran(), Hadeth(),Tasbih(),Radioo(),Setting(),];
}

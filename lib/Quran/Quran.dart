import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:untitled20/MyThem.dart';
import 'package:untitled20/Quran/item_sura_name.dart';

class Quran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
    return Center(
      child: Column(
        children: [
          Expanded(child: Image.asset('assets/images/QuranIcon.png')),
          Divider(thickness: 3,color: MyThem.PrimaryLight, ),
          Text(AppLocalizations.of(context)!.sura_name,style:Theme.of(context).textTheme.subtitle1,),
          Divider(thickness: 3,color: MyThem.PrimaryLight, ),
          Expanded(
              flex: 2,
              child: ListView.separated
                (separatorBuilder: (context,index){
                return Divider(thickness: 3,color: MyThem.PrimaryLight);
              }, itemBuilder: (context,index)
              {
                return ItemSuraName(name: SuraName[index], index: index);
              }, itemCount: SuraName.length,))],
      ),
    );
  }

}
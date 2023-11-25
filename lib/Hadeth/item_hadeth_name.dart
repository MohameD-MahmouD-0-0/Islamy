import 'package:flutter/material.dart';
import 'package:untitled20/Hadeth/HadethDetails.dart';

import '../Quran/Sura_Detailes_Screen.dart';
import 'Hadeth.dart';

class ItemHadethName extends StatelessWidget{

  HadthData hadeth;

  ItemHadethName({required this.hadeth});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap:(){
          Navigator.of(context).pushNamed(Hadeth_Detailes_Screen.routName,arguments: hadeth);
        } ,
        child: Text(hadeth.title,style: Theme.of(context).textTheme.headline4,textAlign: TextAlign.center,));
  }
}
class Args {
  String name;
  int index;
  Args({required this.name,required this.index});
}
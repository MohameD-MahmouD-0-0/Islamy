import 'package:flutter/material.dart';

import 'Sura_Detailes_Screen.dart';

class ItemSuraName extends StatelessWidget{
  String name ;
  int index;
  ItemSuraName({required this.name,required this.index});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap:(){
          Navigator.of(context).pushNamed(Sura_Detailes_Screen.routName,arguments: Args(name: name, index: index));
        } ,
        child: Text(name,style: Theme.of(context).textTheme.headline4,textAlign: TextAlign.center,));
  }
}
class Args {
  String name;
  int index;
  Args({required this.name,required this.index});
}
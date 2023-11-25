import 'package:flutter/material.dart';

class ItemHadethDetailes extends StatelessWidget{
  String contant ;
  ItemHadethDetailes({required this.contant});
  @override
  Widget build(BuildContext context) {
    return Text(contant,style: Theme.of(context).textTheme.headline4,
      textAlign: TextAlign.center,textDirection: TextDirection.rtl,);
  }
}

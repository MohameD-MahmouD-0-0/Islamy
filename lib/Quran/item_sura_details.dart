import 'package:flutter/material.dart';

class ItemSuraDetailes extends StatelessWidget{
  String contant ;
  int index;
  ItemSuraDetailes({required this.contant,required this.index});
  @override
  Widget build(BuildContext context) {
    return Text('$contant ${{index+1}}',style: Theme.of(context).textTheme.headline4,
      textAlign: TextAlign.center,textDirection: TextDirection.rtl,);
  }
}

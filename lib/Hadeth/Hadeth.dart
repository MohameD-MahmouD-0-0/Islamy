import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled20/Hadeth/item_hadeth_name.dart';

import '../MyThem.dart';

class Hadeth extends StatefulWidget {
  @override
  State<Hadeth> createState() => _HadethState();
}

class _HadethState extends State<Hadeth> {
  List<HadthData> HadtheListData = [];

  @override
  void initState() {
    super.initState();
    loadAhadeth();
  }

  @override
  Widget build(BuildContext context) {
    if (HadtheListData.isEmpty) {
      return Center(
        child: CircularProgressIndicator(
          color: MyThem.PrimaryLight,
        ),
      );
    } else {
      return Container(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/hadeth_logo.png'),
              Divider(
                thickness: 3,
                color: MyThem.PrimaryLight,
              ),
              Text(
                'Hadeth',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Divider(thickness: 3,
                color: MyThem.PrimaryLight,
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return InkWell(onTap: (){},
                        child: ItemHadethName(hadeth: HadtheListData[index]));
                  },
                  itemCount: HadtheListData.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(color: MyThem.PrimaryLight,thickness: 3,);
                },
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  Future<void> loadAhadeth() async {
    String ahadthContant =
    await rootBundle.loadString('assets/files/suar/ahadeth.txt');
    List<String> hadethList = ahadthContant.split('#\r\n');
    for (int i = 0; i < hadethList.length; i++) {
      List<String> ahadethLines = hadethList[i].split('\n');
      String title = ahadethLines[0];
      ahadethLines.removeAt(0);
      HadthData hadeth = HadthData(title: title, content: ahadethLines);
      HadtheListData.add(hadeth);
    }
    setState(() {});
  }
}
class HadthData {
  String title;
  List<String> content;

  HadthData({required this.title, required this.content});
}
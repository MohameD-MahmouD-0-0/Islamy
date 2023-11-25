import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled20/MyThem.dart';
import 'package:untitled20/Shea5.dart';
import '../app_config_provider.dart';

class Radioo extends StatelessWidget {
  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return FutureBuilder(
        future: getRadios(),
        builder: (context, snapshot) {
          var radios = snapshot.data?.radios ?? [];
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/radio_image.png'),
                Text(
                  'اذاعه القرءان الكريم',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: provider.appTheme == ThemeMode.light
                          ? MyThem.blackColor
                          : MyThem.whiteColor),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .3,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return RadioItem(provider: provider,radioModel:radios[index],audioPlayer: player,);
                    },
                    itemCount: radios.length,
                    scrollDirection: Axis.horizontal,
                    physics: PageScrollPhysics(),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
Future<Shea5> getRadios() async {
  var url = Uri.parse('https://mp3quran.net/api/v3/radios');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var bodystring = response.body;
    var json = jsonDecode(bodystring);
    return Shea5.fromJson(json);
  } else {
    throw Exception('failed to load radios');
  }
}

class RadioItem extends StatelessWidget {
  AudioPlayer audioPlayer;
  RadioModel radioModel;
   RadioItem({
    super.key,
    required this.audioPlayer,
    required this.provider,
    required this.radioModel
  });

  final AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text(radioModel.name??'unKnown',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: provider.appTheme == ThemeMode.light
                      ? MyThem.blackColor
                      : MyThem.whiteColor)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () async {
                    await audioPlayer.play(UrlSource(radioModel.url!));
                  },
                  icon: Icon(Icons.play_arrow,
                      color: provider.appTheme == ThemeMode.light
                          ? MyThem.PrimaryLight
                          : MyThem.YellowColor)),
              SizedBox(
                width: 5,
              ),
              IconButton(
                  onPressed: () {
                    audioPlayer.stop();
                  },
                  icon: Icon(Icons.stop,
                      color: provider.appTheme == ThemeMode.light
                          ? MyThem.PrimaryLight
                          : MyThem.YellowColor))
            ],
          ),
        ],
      ),
    );
  }
}

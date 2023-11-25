import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../MyThem.dart';
import '../app_config_provider.dart';

class SettingSheet extends StatefulWidget {
  @override
  State<SettingSheet> createState() => _SettingSheetState();
}

class _SettingSheetState extends State<SettingSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              provider.ChangeTheme(ThemeMode.light);
            },
            child: provider.appTheme == ThemeMode.light
                ? getWidgetSelected('Light')
                : getUnWidgetSelected('Light'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              provider.ChangeTheme(ThemeMode.dark);
            },
            child: provider.appTheme == ThemeMode.dark
                ? getWidgetSelected('Dark')
                : getUnWidgetSelected('Dark'),
          ),
        ),
      ],
    );
  }

  Widget getWidgetSelected(String text) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(text,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: MyThem.blackColor)),
          Icon(Icons.check, size: 30, color: MyThem.blackColor),
        ]),
      ),
    );
  }

  Widget getUnWidgetSelected(String text) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(text,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: MyThem.blackColor))
          ]),
        ));
  }
}

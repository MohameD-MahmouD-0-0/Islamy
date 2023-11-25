import 'package:flutter/material.dart';

class MyThem {
  static Color blackColor=Color(0xff242424);
  static Color PrimaryLight=Color(0xffB7935F);
  static Color whiteColor=Colors.white;
  static Color PrimaryDark=Color(0xff141A2E);
  static Color YellowColor=Color(0xffFACC1D);
  static ThemeData ligthMode=ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
    primaryColor: PrimaryLight,
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: blackColor),
        backgroundColor: Colors.transparent,
          elevation: 0,
      centerTitle: true
    ),
    textTheme: TextTheme(
        headline1:TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: blackColor,
        ),
            subtitle1: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
      headline4: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
      )
    ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor:PrimaryDark
      ,selectedItemColor: blackColor,
        unselectedItemColor: whiteColor,
          showSelectedLabels: true,
        showUnselectedLabels: true,
      ),

  );
  static ThemeData DarkTheme=ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: PrimaryDark,
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: whiteColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true
    ),
    textTheme: TextTheme(
        headline1:TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: whiteColor,
        ),
        subtitle1: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: whiteColor,
        ),
        headline4: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: YellowColor,
        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor:PrimaryDark
      ,selectedItemColor: YellowColor,
      unselectedItemColor: whiteColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),

  );
}
import 'package:flutter/material.dart';
import 'app_color.dart';

AppColor _color = AppColor();

class AppTheme {
  final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: _color.bgColor,
    primaryColor: _color.primaryColor,
    canvasColor: _color.bgColor,
    appBarTheme: AppBarTheme(color: _color.primaryColor, iconTheme: IconThemeData(color: Colors.white)),
    iconTheme: IconThemeData(color: _color.primaryColor.withOpacity(0.4)),
    cardColor: Colors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.red,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: _color.textPrimaryColor),
      bodyText2: TextStyle(color: _color.textPrimaryColor),
      headline4: TextStyle(color: _color.textPrimaryColor),
      headline1: TextStyle(color: _color.textPrimaryColor),
    ),
    //unselectedWidgetColor: Colors.blue[400],
    /*buttonTheme: ButtonThemeData(
      buttonColor: Colors.blueAccent,
      textTheme: ButtonTextTheme.primary,
    ),*/
  );

  final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey[700],
    canvasColor: Colors.grey[800],
    toggleableActiveColor: Colors.grey[300],
    appBarTheme: AppBarTheme(color: Colors.grey[900], iconTheme: IconThemeData(color: Colors.grey[100])),
    iconTheme: IconThemeData(color: Colors.grey[300]),
    cardColor: Colors.black,
    textTheme: TextTheme(
      //header
      headline1: TextStyle(color: Colors.white),
      headline2: TextStyle(color: Colors.white),
      headline3: TextStyle(color: Colors.white),
      headline4: TextStyle(color: Colors.white),
      headline5: TextStyle(color: Colors.white),
      headline6: TextStyle(color: Colors.white),
      //subtitle
      subtitle1: TextStyle(color: Colors.white),
      subtitle2: TextStyle(color: Colors.white),
      //body
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.white),
    ),
    /*unselectedWidgetColor: Colors.grey[300],
    dividerColor: Colors.grey[500],
    buttonTheme: ButtonThemeData(buttonColor: Colors.grey[900], textTheme: ButtonTextTheme.primary),*/
  );
}

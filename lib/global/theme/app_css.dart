import 'package:flutter/material.dart';
import '../utility/app_screen_util.dart';

// used _ (underscore) for only used in this file
AppScreenUtil _appScreenUtil = AppScreenUtil();

//font weight
const FontWeight thin = FontWeight.w100;
const FontWeight extraLight = FontWeight.w200;
const FontWeight light = FontWeight.w300;
const FontWeight regular = FontWeight.w400;
const FontWeight medium = FontWeight.w500;
const FontWeight semiBold = FontWeight.w600;
const FontWeight bold = FontWeight.w700;
const FontWeight extraBold = FontWeight.w800;
const FontWeight thick = FontWeight.w900;

//font family
String textFontFamily = "CeraPro";

//Functions
TextStyle textExtraBold(double size) {
  return TextStyle(
    fontSize: _appScreenUtil.fontSize(size),
    fontWeight: extraBold,
    //color: textPrimaryColor,
  );
}

TextStyle textSemiBold(double size) {
  return TextStyle(
    fontSize: _appScreenUtil.fontSize(size),
    fontWeight: semiBold,
    //color: textPrimaryColor,
  );
}

TextStyle textRegular(double size) {
  return TextStyle(
    fontSize: _appScreenUtil.fontSize(size),
    //color: textPrimaryColor,
  );
}

TextStyle textLetterSpacing(double size) {
  return TextStyle(
    letterSpacing: size,
  );
}

class AppCss {
  //Text Style
  TextStyle h1 = textExtraBold(20);

  TextStyle h2 = textSemiBold(18);

  TextStyle h3 = textSemiBold(16);

  TextStyle h4 = textSemiBold(14);

  TextStyle h5 = textSemiBold(12);

  TextStyle bodyStyle1 = textRegular(20);

  TextStyle bodyStyle2 = textRegular(18);

  TextStyle bodyStyle3 = textRegular(16);

  TextStyle bodyStyle4 = textRegular(14);

  TextStyle bodyStyle5 = textRegular(12);

  //Letter Spacing
  TextStyle ls1 = textLetterSpacing(1);

  TextStyle ls2 = textLetterSpacing(2);

  TextStyle ls3 = textLetterSpacing(3);

  TextStyle ls4 = textLetterSpacing(4);

  TextStyle ls5 = textLetterSpacing(5);
}

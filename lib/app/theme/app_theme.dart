import 'package:flutter/material.dart';

import 'dark_theme.dart';
import 'light_theme.dart';

class AppTheme {
  static ThemeData light = lightTheme;
  static ThemeData dark = darkTheme;
}


class AppColor{
  static Color primary_color=Colors.redAccent;
  static Color accent_color =Colors.orangeAccent;
  static Color text_button_color =Color(0xfff);
  static Color bg_color= Color(0xb8b7b8);
  static Color text_inline_color= Color(0x5B98DC);
  static Color whiteapp= Colors.white;
}

class AppStyleText{
  static TextStyle black_text_style=TextStyle();
}

class AppImage{
  static String bg="assets/images/bg.jpg";
  static String bg1="assets/images/bg1.jpg";
  static String bg2="assets/images/bg2.jpg";
  static String bg3="assets/images/bg3.jpg";
  static String bg4="assets/images/bg4.jpg";
  static String logoflutter="assets/images/logoflutter.png";
  static String img_notfound="assets/images/not_found.jpg";
  static String pinmap="assets/images/map_pin.jpg";
  static String pinmap2="assets/images/43715.jpg";
  static String faceid="assets/images/faceid.png";

}
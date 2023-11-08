import 'package:flutter/material.dart';

class genericStyles
{
  //Material Colors
  static MaterialColor lsuPurple = MaterialColor(0xff461d7c, lsuPurpleSwatch);
  static Map<int, Color> lsuPurpleSwatch =
  {
    50:const Color.fromRGBO(70, 29, 124, .1),
    100:const Color.fromRGBO(70, 29, 124, .2),
    200:const Color.fromRGBO(70, 29, 124, .3),
    300:const Color.fromRGBO(70, 29, 124, .4),
    400:const Color.fromRGBO(70, 29, 124, .5),
    500:const Color.fromRGBO(70, 29, 124, .6),
    600:const Color.fromRGBO(70, 29, 124, .7),
    700:const Color.fromRGBO(70, 29, 124, .8),
    800:const Color.fromRGBO(70, 29, 124, .9),
    900:const Color.fromRGBO(70, 29, 124, 1),
  };
  static MaterialColor lsuYellow = MaterialColor(0xfffdd026, lsuYellowSwatch);
  static Map<int, Color> lsuYellowSwatch =
  {
    50:const Color.fromRGBO(254, 208, 35, .1),
    100:const Color.fromRGBO(254, 208, 35, .2),
    200:const Color.fromRGBO(254, 208, 35, .3),
    300:const Color.fromRGBO(254, 208, 35, .4),
    400:const Color.fromRGBO(254, 208, 35, .5),
    500:const Color.fromRGBO(254, 208, 35, .6),
    600:const Color.fromRGBO(254, 208, 35, .7),
    700:const Color.fromRGBO(254, 208, 35, .8),
    800:const Color.fromRGBO(254, 208, 35, .9),
    900:const Color.fromRGBO(254, 208, 35, 1),
  };

  static ThemeData purpleTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: lsuPurple, brightness: Brightness.dark)
  );
  static ThemeData yellowTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: lsuYellow, brightness: Brightness.light)
  );
}

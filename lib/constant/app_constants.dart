import 'package:flutter/material.dart';

const Color mainColor = Color.fromARGB(255, 47, 47, 47);
const Color accentColor = Color.fromARGB(255, 254, 111, 39);

// to make custom Palette
// https://maketintsandshades.com/
class Palette {
  static const MaterialColor kToDark = MaterialColor(
    0xfffe6f27, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffe56423), //10%
      100: Color(0xffcb591f), //20%
      200: Color(0xffb24e1b), //30%
      300: Color(0xff984317), //40%
      400: Color(0xff7f3814), //50%
      500: Color(0xff662c10), //60%
      600: Color(0xff4c210c), //70%
      700: Color(0xff331608), //80%
      800: Color(0xff190b04), //90%
      900: Color(0xff000000), //100%
    },
  );
}

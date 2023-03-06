import 'package:flutter/material.dart';



class Palette {
  static const MaterialColor myPaletteDark = MaterialColor(
    0xff845ec2, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff7755af), //10%
      100: Color(0xff6a4b9b), //20%
      200: Color(0xff5c4288), //30%
      300: Color(0xff4f3874), //40%
      400: Color(0xff422f61), //50%
      500: Color(0xff35264e), //60%
      600: Color(0xff281c3a), //70%
      700: Color(0xff1a1327), //80%
      800: Color(0xff0d0913), //90%
      900: Color(0xff000000), //100%
    },
  );


  static const MaterialColor myPaletteLight = MaterialColor(
    0xff845ec2, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff906ec8), //10%
      100: Color(0xff9d7ece), //20%
      200: Color(0xffa98ed4), //30%
      300: Color(0xffb59eda), //40%
      400: Color(0xffc2afe1), //50%
      500: Color(0xffcebfe7), //60%
      600: Color(0xffdacfed), //70%
      700: Color(0xffe6dff3), //80%
      800: Color(0xfff3eff9), //90%
      900: Color(0xffffffff), //100%
    },
  );
}
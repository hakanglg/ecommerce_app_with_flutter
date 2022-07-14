import 'package:flutter/material.dart';

class ColorConstants {
  static ColorConstants instance = ColorConstants._init();
  ColorConstants._init();

  final black = const Color(0xff222222);
  final grey = const Color(0xFF9B9B9B);
  final primary = const Color(0xFFDB3022);
  final background = const Color(0xFFF9F9F9);
  final white = const Color(0xFFFFFFFF);
  final error = const Color(0xFFF01F0E);
  final success = const Color(0xFF2AA952);
  final yellow = const Color(0xffFFBA49);

  // final linaerColorTopRightBottomLeft = LinearGradient(
  //     begin: Alignment.topLeft,
  //     end: Alignment.bottomRight,
  //     colors: [
  //       ColorConstants.instance.legendaryLevender,
  //       ColorConstants.instance.magnolia
  //     ]);

}

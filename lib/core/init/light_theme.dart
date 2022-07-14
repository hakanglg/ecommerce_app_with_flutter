import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app/applications_constants.dart';
import '../constants/color/color_constants.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: ApplicationConstants.FONT_FAMILY,
  scaffoldBackgroundColor: ColorConstants.instance.background,
  drawerTheme:
      DrawerThemeData(backgroundColor: ColorConstants.instance.background),
  appBarTheme: AppBarTheme(
    backgroundColor: ColorConstants.instance.background,
    iconTheme: IconThemeData(color: ColorConstants.instance.white),
  ),
  textTheme: TextTheme(
      headline1: TextStyle(
        // HEADLINE 1
        color: ColorConstants.instance.black,
        fontWeight: FontWeight.bold,
        fontSize: 34.sp,
      ),
      headline2: TextStyle(
        // HEADLINE 2
        color: ColorConstants.instance.black,
        fontWeight: FontWeight.bold,
        fontSize: 24.sp,
      ),
      headline3: TextStyle(
        // HEADLINE 3
        color: ColorConstants.instance.black,
        fontWeight: FontWeight.bold,

        fontSize: 18.sp,
      ),
      bodyText1: TextStyle(
        // TEXT
        color: ColorConstants.instance.black,
        fontSize: 16.sp,
      ),
      bodyText2: TextStyle(
        color: ColorConstants.instance.black,
        fontWeight: FontWeight.bold,
        fontSize: 16.sp,
      ),
      subtitle1: TextStyle(
        // HELPER TEXT
        color: ColorConstants.instance.grey,
        fontSize: 11.sp,
      )),
  iconTheme: IconThemeData(color: ColorConstants.instance.white),
);

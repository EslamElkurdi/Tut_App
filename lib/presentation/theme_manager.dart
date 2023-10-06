import 'package:flutter/material.dart';
import 'package:tut_app/presentation/color_manager.dart';

ThemeData getApplicationTheme()
{
  return ThemeData(

    // main color
    primaryColor: ColorManager.primary,
    primaryColorDark: ColorManager.darkPrimary,
    primaryColorLight: ColorManager.lightGrey,
    disabledColor: ColorManager.grey1,

    // cardView Theme


    // AppBar Theme


    // button Theme


    // input decoration Theme (Text Form Field)


    // Text theme


  );
}
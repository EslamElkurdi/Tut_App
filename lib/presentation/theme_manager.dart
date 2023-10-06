import 'package:flutter/material.dart';
import 'package:tut_app/presentation/color_manager.dart';
import 'package:tut_app/presentation/fonts_manager.dart';
import 'package:tut_app/presentation/styles_manager.dart';
import 'package:tut_app/presentation/values_manager.dart';

ThemeData getApplicationTheme()
{
  return ThemeData(

    // main color
    primaryColor: ColorManager.primary,
    primaryColorDark: ColorManager.darkPrimary,
    primaryColorLight: ColorManager.lightGrey,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.primaryOpacity70,

    // cardView Theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),


    // AppBar
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.primaryOpacity70,
      titleTextStyle: getRegularStyle(
          color: ColorManager.white,
          fontSize: FontSize.s16
      ),
    ),


    // button Theme


    // input decoration Theme (Text Form Field)


    // Text theme


  );
}
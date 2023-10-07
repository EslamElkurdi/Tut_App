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
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      splashColor: ColorManager.primaryOpacity70,
      buttonColor: ColorManager.primary,
    ),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
            color: ColorManager.white,
          fontSize: FontSize.s17
        ),
        primary: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12)
        )
      )
    ),


    // input decoration Theme (Text Form Field)
      inputDecorationTheme: InputDecorationTheme(
        // content Padding
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        // hint style
        hintStyle: getRegularStyle(
            color: ColorManager.grey, fontSize: FontSize.s14
        ),
        labelStyle: getMediumStyle(
            color: ColorManager.grey, fontSize: FontSize.s14
        ),
        errorStyle: getRegularStyle(
            color: ColorManager.error
        ),
        // enabled border style
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.primary, width: AppSize.s1_5
          ),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
        ),

        // focused border style
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorManager.grey, width: AppSize.s1_5
            ),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
        ),

        // error border style
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorManager.error, width: AppSize.s1_5
            ),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
        ),

        // focused error border style
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorManager.primary, width: AppSize.s1_5
            ),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
        )


      ),


    // Text theme
    textTheme: TextTheme(
      displayLarge: getLightStyle(color: ColorManager.white, fontSize: FontSize.s22),
      headline1: getSemiBoldStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),
      subtitle1: getMediumStyle(color: ColorManager.lightGrey, fontSize: FontSize.s14),
      caption: getRegularStyle(color: ColorManager.grey1),
      bodyText1: getRegularStyle(color: ColorManager.grey),
  )

  );
}
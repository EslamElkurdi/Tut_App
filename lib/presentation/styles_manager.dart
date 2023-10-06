import 'package:flutter/material.dart';
import 'package:tut_app/presentation/fonts_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color)
{
  return TextStyle(
    fontFamily: FontConstants.fontFamily,
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight
  );
}

// regular style
TextStyle getRegularStyle({double fontSize = FontSize.s12, required Color color})
{
  return _getTextStyle(fontSize, FontWeightManager.Regular, color);
}

// light style
TextStyle getLightStyle({double fontSize = FontSize.s12, required Color color})
{
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}

// SemiBold style
TextStyle getSemiBoldStyle({double fontSize = FontSize.s12, required Color color})
{
  return _getTextStyle(fontSize, FontWeightManager.SemiBold, color);
}

// bold style
TextStyle getBoldStyle({double fontSize = FontSize.s12, required Color color})
{
  return _getTextStyle(fontSize, FontWeightManager.Bold, color);
}
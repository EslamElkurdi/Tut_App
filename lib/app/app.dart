import 'package:flutter/material.dart';
import 'package:tut_app/presentation/theme_manager.dart';

// ignore: must_be_immutable
class MyApp extends StatefulWidget {

  MyApp._internal();

  int appState = 0;

  static final MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: getApplicationTheme(),
    );
  }
}
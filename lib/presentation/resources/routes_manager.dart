import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tut_app/presentation/forgot_password/forgot_password_view.dart';
import 'package:tut_app/presentation/login/login_view.dart';
import 'package:tut_app/presentation/main/main_view.dart';
import 'package:tut_app/presentation/register/register_view.dart';
import 'package:tut_app/presentation/splash/splash_view.dart';
import 'package:tut_app/presentation/store_details/store_details_view.dart';

class Routes
{
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RoutesGenerator
{
  static Route<dynamic> getRoute(RouteSettings settings)
  {
    switch(settings.name)
    {
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_)=> const ForgotPasswordView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_)=> const LoginView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_)=> const MainView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_)=> const RegisterView());
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_)=> const SplashView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_)=> const StoreDetailsView());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute()
  {
    return MaterialPageRoute(builder: (_)=> Scaffold(
      appBar: AppBar(
        title: const Text("No Route Found"), // move to string manager
      ),
      body: const Center(
        child: Text("No Route Found"), // move to string manager
      ),
    ));
  }
}
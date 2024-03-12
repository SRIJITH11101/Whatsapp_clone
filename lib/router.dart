import 'package:flutter/material.dart';
import 'package:whatsapp/commons/widgets/errorwidget.dart';
import 'package:whatsapp/features/auth/screens/login_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (context) => LoginScreen());
      break;
    default:
      return MaterialPageRoute(
          builder: (context) => Scaffold(
                body: ErrorWidgets(error: 'This page does not exist'),
              ));
  }
}

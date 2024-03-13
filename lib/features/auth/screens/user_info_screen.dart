import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});
  static const String routeName = "/user-info";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('User Info'),
      ),
    );
  }
}

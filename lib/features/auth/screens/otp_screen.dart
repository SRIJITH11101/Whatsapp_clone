import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OTPScreen extends StatefulWidget {
  static const String routeName = '/otp-screen';
  final String varificationId;
  const OTPScreen({super.key, required this.varificationId});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'OTP SCREEN',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}

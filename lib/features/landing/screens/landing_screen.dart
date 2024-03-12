import 'package:flutter/material.dart';
import 'package:whatsapp/colors.dart';

class landing_screen extends StatelessWidget {
  const landing_screen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          Text(
            'Welcome to WhatsApp',
            style: TextStyle(fontSize: 33, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: size.height / 9),
          Image.asset(
            "assets/bg1.png",
            height: 340,
            width: 340,
            color: tabColor,
          ),
          SizedBox(height: size.height / 9),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Text(
              'Read our Privacy Policy. Tap\'Agree and Continue\' \nto accept the Terms and service ',
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: null,
              child: Text(
                'Accept and Continue',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: tabColor,
                  minimumSize: Size(double.infinity, 50)),
            ),
          )
        ],
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:whatsapp/colors.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;
  const CommonButton({
    super.key,
    required this.text,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      child: Text(
        text,
        style: TextStyle(color: Colors.black),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: tabColor, minimumSize: Size(double.infinity, 50)),
    );
  }
}

import 'package:flutter/material.dart';

class ErrorWidgets extends StatelessWidget {
  final String error;
  const ErrorWidgets({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error),
    );
  }
}

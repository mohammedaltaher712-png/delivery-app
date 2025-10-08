import 'package:flutter/material.dart';

class Customsetingtitlecard extends StatelessWidget {
  const Customsetingtitlecard({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, right: 15),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }
}

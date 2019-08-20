import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Color color;

  CustomAppBar(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      height: 160.0,
      child: AppBar(
        backgroundColor: color,
        title: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5),
          ),
        ),
      ),
    );
  }
}

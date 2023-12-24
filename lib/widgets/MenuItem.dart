import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String title;

  MenuItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: Color(0xFF475269),
        ),
      ),
    );
  }
}

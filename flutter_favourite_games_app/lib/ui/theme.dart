import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    backgroundColor: Color(0xFF5A5A5A),
    primarySwatch: Colors.blue,
    primaryColor: Color(0xFF08ebc2),
    scaffoldBackgroundColor: Color(0xFF333333),
    dialogBackgroundColor: Color.fromARGB(255, 255, 255, 255),
    primaryTextTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Color(0xffffff),
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
      bodyText2: TextStyle(
        color: Color(0x08ebc2),
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

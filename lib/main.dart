import 'package:bmi/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.light(useMaterial3: true).copyWith(),
    darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                )))),

    themeMode: ThemeMode.dark,
    home: const HomePage(),
  ));
}

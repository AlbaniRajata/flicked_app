//Packages
import 'package:flutter/material.dart';

//Pages
import './pages/splash_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(
        key: UniqueKey(),
        onInitializationComplete: () {},
      ),
    ),
  );
}
import 'package:flutter/material.dart';
import 'package:gotur/screens/main_screen.dart';
import 'package:gotur/screens/product_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/home",
      routes: {
        "/home":(BuildContext context) => MainScreen(),
        "/product":(BuildContext context) => ProductScreen(),
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/ui/menu_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Challenges',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MenuPage(),
    );
  }
}

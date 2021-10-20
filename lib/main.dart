import 'package:cocktail_app/homepage.dart';
import 'package:flutter/material.dart';

const Color myColor = Colors.red;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cocktail",
      theme: ThemeData(primarySwatch: Colors.orange),
      home: HomePage(),
    );
  }
}

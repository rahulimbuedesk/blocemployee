import 'package:flutter/material.dart';

import 'homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My employee app',
      
      theme: ThemeData(
        primarySwatch : Colors.amber
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
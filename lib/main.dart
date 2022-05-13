import 'package:flutter/material.dart';
import 'package:receipe_app_1/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Recipe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}

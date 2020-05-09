import 'package:flutter/material.dart';
import 'package:flutter_basics/screens/home.dart';

void main() => runApp(HelloFlutterApp());

class HelloFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hello Flutter",
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              "App Bar",
              style: TextStyle(color: Colors.deepPurple),
            ),
            backgroundColor: Colors.white70,
          ),
          body: Home()),
    );
  }
}

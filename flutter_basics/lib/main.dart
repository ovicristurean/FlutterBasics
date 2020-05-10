import 'package:flutter/material.dart';
import 'package:flutter_basics/screens/home.dart';
import 'package:flutter_basics/ui/home.dart';

void main() => runApp(WidgetsHome());

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

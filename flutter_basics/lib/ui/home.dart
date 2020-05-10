import 'package:flutter/material.dart';
import 'package:flutter_basics/ui/PizzaScreen.dart';

class WidgetsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Flutterfly"),
            backgroundColor: Colors.deepOrangeAccent,
          ),
          body: PizzaScreen(),
        ));
  }
}

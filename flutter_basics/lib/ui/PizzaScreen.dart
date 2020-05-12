import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PizzaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
      appBar: AppBar(
        title: Text("Flutterfly"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: PizzaScreenContent(),
    ));
  }
}

class PizzaScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30.0, left: 10.0),
      alignment: Alignment.center,
      color: Colors.white70,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              PizzaImageWidget('assets/pizza_margherita.svg'),
              Expanded(
                child: Text(
                  "Margherita",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 30.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'Oxygen',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Tomato, Mozarella, Basil",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 20.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'Oxygen',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              )
            ],
            textDirection: TextDirection.ltr,
          ),
          Row(
            children: <Widget>[
              PizzaImageWidget('assets/pizza_marinara.svg'),
              Expanded(
                child: Text(
                  "Marinara",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 30.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'Oxygen',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Tomato, Garlic",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 20.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'Oxygen',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
            textDirection: TextDirection.ltr,
          ),
          OrderButton()
        ],
      ),
      /*width: 192.0,
          height: 96.0,
         margin: EdgeInsets.only(left:50.0),*/
    );
  }
}

class PizzaImageWidget extends StatelessWidget {
  String assetName;

  PizzaImageWidget(String assetName) {
    this.assetName = assetName;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      child: SvgPicture.asset(assetName),
    );
  }
}

class OrderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 40.0,
      child: RaisedButton(
        child: Text(
          "Order",
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
        onPressed: () {
          order(context);
        },
        color: Colors.deepOrangeAccent,
        elevation: 5.0,
      ),
      margin: EdgeInsets.only(top: 50.0),
    );
  }

  void order(BuildContext context) {
    var alert = AlertDialog(
      title: Text("Order completed"),
      content: Text("Thanks for your order"),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}

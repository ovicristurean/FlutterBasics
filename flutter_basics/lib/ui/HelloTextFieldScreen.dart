import 'package:flutter/material.dart';

class HelloTextFieldScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Trip Cost Calculator",
              style: TextStyle(color: Colors.white70)),
          backgroundColor: Colors.black12,
        ),
        body: FuelForm(),
      ),
    );
  }
}

class FuelForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FuelFormState();
  }
}

class FuelFormState extends State<FuelForm> {
  String result = "";
  final double formDistance = 5.0;
  final currencies = ["Dollars", "Euro", "Pounds"];
  String selectedCurrency = "Dollars";
  TextEditingController distanceController = TextEditingController();
  TextEditingController avgController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline6;
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 5.0,
              bottom: 5.0,
            ),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'e.g. 124',
                  labelStyle: textStyle,
                  labelText: "Distance",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )),
              keyboardType: TextInputType.number,
              controller: distanceController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 5.0,
              bottom: 5.0,
            ),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'e.g. 17',
                  labelStyle: textStyle,
                  labelText: "Distance per unit",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )),
              keyboardType: TextInputType.number,
              controller: avgController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 5.0,
              bottom: 5.0,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'e.g. 1.65',
                        labelStyle: textStyle,
                        labelText: "Price",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                    keyboardType: TextInputType.number,
                    controller: priceController,
                  ),
                ),
                Container(
                  width: 25.0,
                ),
                Expanded(
                  child: DropdownButton<String>(
                    items: currencies
                        .map(
                          (currency) => DropdownMenuItem<String>(
                            value: currency,
                            child: Text(currency),
                          ),
                        )
                        .toList(),
                    onChanged: (String value) {
                      onDropdownChanged(value);
                    },
                    value: selectedCurrency,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  color: Theme.of(context).primaryColorDark,
                  textColor: Theme.of(context).primaryColorLight,
                  onPressed: () {
                    setState(() {
                      result = calculate();
                    });
                  },
                  child: Text(
                    "Submit",
                    textScaleFactor: 1.5,
                  ),
                ),
              ),
              Container(
                width: 25.0,
              ),
              Expanded(
                child: RaisedButton(
                  color: Theme.of(context).buttonColor,
                  textColor: Theme.of(context).primaryColorDark,
                  onPressed: () {
                    setState(() {
                      reset();
                    });
                  },
                  child: Text(
                    "Reset",
                    textScaleFactor: 1.5,
                  ),
                ),
              ),
            ],
          ),
          Text(
            result,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void onDropdownChanged(String value) {
    setState(() {
      selectedCurrency = value;
    });
  }

  String calculate() {
    double distance = double.parse(distanceController.text);
    double fuelCost = double.parse(priceController.text);
    double consumption = double.parse(avgController.text);
    double totalCost = distance / consumption * fuelCost;
    return "The total cost of your trip is " +
        totalCost.toStringAsFixed(2) +
        " " +
        selectedCurrency;
  }

  void reset() {
    distanceController.text = "";
    priceController.text = "";
    avgController.text = "";
    result = "";
  }
}

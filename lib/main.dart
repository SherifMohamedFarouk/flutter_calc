import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: FavCity(),
  ));
}

class FavCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FavCityState();
  }
}

class FavCityState extends State {
  String name = "";
  var currencies = ['Euro', 'Dollar', 'EGP ', 'Others'];
  var currentCuren = 'Dollar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statefull ex"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              onSubmitted: (String userinput) {
                setState(() {
                  name = userinput;
                });
              },
            ),
            DropdownButton<String>(
              items: currencies.map((String dropDown) {
                return DropdownMenuItem<String>(
                  value: dropDown,
                  child: Text(dropDown),
                );
              }).toList(),
              onChanged: (String value) {
                setState(() {
                  this.currentCuren = value;
                });
              },
              value: currentCuren,
            ),
            Padding(
                padding: EdgeInsets.all(30.0),
                child: Text("your best city $name"))
          ],
        ),
      ),
    );
  }
}

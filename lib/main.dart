import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home:FavCity(),
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
            Padding(
              padding:  EdgeInsets.all(30.0),
                child:Text("your best city $name")
            )
          ],
        ),
      ),
    );
  }
}

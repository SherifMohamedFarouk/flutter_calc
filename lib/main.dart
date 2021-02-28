import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.indigo,
          accentColor: Colors.indigoAccent,
        brightness: Brightness.light
    ),
    debugShowCheckedModeBanner: false,
    home: MoneyCalc(),
  ));
}

class MoneyCalc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MoneyCalcState();
  }
}

class MoneyCalcState extends State<MoneyCalc> {
  var currencies = ['Dollar', 'Euro', 'Egp'];
  var minmumpadding = 5.0;
  var currentcurrencies = 'Dollar';


  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      // backgroundColor: Colors.black12,
      // resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Money Calculator"),
      ),
      body: Container(
        child: ListView(
          children: [
            getImageAsset(),
            Padding(
              padding: EdgeInsets.all(minmumpadding),
              child: TextField(cursorColor:Colors.white ,
                decoration: InputDecoration(
                    labelText: 'Principal',

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(minmumpadding))),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(minmumpadding),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Rate of interest ',
                      hintText: 'in  percent',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(minmumpadding))),
                )),
            Row(
                children: [
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.all(minmumpadding),
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: 'Term',
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(minmumpadding))),
                        )),
                  ),
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.all(minmumpadding),
                        child: DropdownButton<String>(
                          hint: Text("Select a currencies"),
                          value: currentcurrencies,
                          onChanged: (String value) {
                            setState(() {
                              currentcurrencies = value;
                            });
                          },
                          items:currencies.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        )
                    ),
                  ),

                ]
            ),
            Row(
                children: [
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.all(minmumpadding),
                        child: RaisedButton(
                          color: Theme.of(context).accentColor,
                          child: Text('Calculate',style: textStyle,),

                          onPressed:() {

                          },
                        ),
                  ),),
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.all(minmumpadding),
                        child:RaisedButton(
                          child: Text('Reset',style: textStyle),
                          color: Colors.blueGrey
                          ,
                          onPressed:() {

                          },
                        ),
                    ),
                  ),

                ]
            ),
          ],
        ),
      ),
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/download.png');
    Image image = Image(
      image: assetImage,
      width: 250.0,
      height: 150.0,
    );
    return Container(
      child: image,
      margin: EdgeInsets.all(40.0),
    );
  }
}

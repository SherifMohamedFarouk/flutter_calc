import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent,
        brightness: Brightness.light),
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
  var formKey = GlobalKey<FormState>();
  var currencies = ['Dollar', 'Euro', 'Egp'];
  var minmumpadding = 5.0;
  var currentcurrencies = 'Dollar';
  TextEditingController principalController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController termController = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      // backgroundColor: Colors.black12,
      // resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Money Calculator"),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            getImageAsset(),
            Padding(
              padding: EdgeInsets.all(minmumpadding),
              child: TextFormField(
                cursorColor: Colors.white,
                controller: principalController,
                validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter princaple amount';
                    }
                  },

                decoration: InputDecoration(
                    labelText: 'Principal',
                    errorStyle: TextStyle(
                      color:Colors.yellowAccent
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(minmumpadding))),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(minmumpadding),
                child: TextField(
                  controller: rateController,
                  decoration: InputDecoration(
                      labelText: 'Rate of interest ',
                      hintText: 'in  percent',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(minmumpadding))),
                )),
            Row(children: [
              Expanded(
                child: Padding(
                    padding: EdgeInsets.all(minmumpadding),
                    child: TextField(
                      controller: termController,
                      decoration: InputDecoration(
                          labelText: 'Term',
                          hintText: 'In years',
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
                      items: currencies
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
              ),
            ]),
            Row(children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(minmumpadding),
                  child: RaisedButton(
                    color: Theme.of(context).accentColor,
                    child: Text(
                      'Calculate',
                      style: textStyle,
                    ),
                    onPressed: () {
                      setState(() {
                        if(formKey.currentState.validate()) {
                          result = calculateTheMoney();
                        }
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(minmumpadding),
                  child: RaisedButton(
                    child: Text('Reset', style: textStyle),
                    color: Colors.blueGrey,
                    onPressed: () {
                      setState(() {
                        reset();
                      });
                    },
                  ),
                ),
              ),
            ]),
            Padding(
                padding: EdgeInsets.all(minmumpadding * 2),
                child: Text(
                  result,
                  style: textStyle,
                ))
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

  String calculateTheMoney() {
    double principal = double.parse(principalController.text);
    double rate = double.parse(rateController.text);
    double term = double.parse(termController.text);
    double investment = principal + (principal * rate * term) / 100;
    return 'after $term of years , your investment will be worth $investment $currentcurrencies';
  }

  void reset() {
    principalController.text = '';
    termController.text = "";
    rateController.text = "";
    result = "";
    currentcurrencies = currencies[0];
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Simple Interest Calculator",
    home: FavoriteCity(),
  ));
}

// ignore: use_key_in_widget_constructors
class FavoriteCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FavoriteCityState();
  }
}

class _FavoriteCityState extends State<FavoriteCity> {
  var _formKey = GlobalKey<FormState>();
  final _currencies = ['Rupees', 'AED', 'Pounds'];
  var _currentItemSelected = 'Rupees';
  final _minimumPadding = 5.0;

  @override
  void initState() {
    super.initState();
    _currentItemSelected = _currencies[0];
  }

  TextEditingController principleController = TextEditingController();
  TextEditingController termController = TextEditingController();
  TextEditingController roiController = TextEditingController();

  var displayResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Interest Calculator"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
            padding: EdgeInsets.all(_minimumPadding * 4),
            child: ListView(
              children: <Widget>[
                getMoneyImage(),
                Padding(
                    padding: EdgeInsets.only(
                        top: _minimumPadding, bottom: _minimumPadding),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: principleController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter principle amount';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Principal',
                        hintText: 'Enter principal, ex: 12000',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        top: _minimumPadding, bottom: _minimumPadding),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: roiController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Rate of interest';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Rate of interest',
                        hintText: 'In percent',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        top: _minimumPadding, bottom: _minimumPadding),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: termController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please define period';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Term',
                            hintText: 'Time in years',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                        )),
                        Container(
                          width: _minimumPadding * 5,
                        ),
                        Expanded(
                            child: DropdownButton<String>(
                                items: _currencies.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                value: _currentItemSelected,
                                onChanged: (String? newValueSelected) {
                                  _onDropDownItemSelected(newValueSelected!);
                                }))
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.only(
                      top: _minimumPadding, bottom: _minimumPadding),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          child: Text('Calculate', textScaleFactor: 1.5),
                          onPressed: () {
                            setState(() {
                              if (_formKey.currentState!.validate()) {
                                displayResult = _calculateReturns();
                              }
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          child: Text('Reset', textScaleFactor: 1.5),
                          onPressed: () {
                            setState(() {
                              _reset();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(_minimumPadding * 2),
                  child: Text(
                    displayResult,
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      _currentItemSelected = newValueSelected;
    });
  }

  Widget getMoneyImage() {
    AssetImage assetImage = const AssetImage('images/money.png');
    return Container(
      child: Image(
        image: assetImage,
        width: 125.0,
        height: 125.0,
      ),
      margin: EdgeInsets.all(_minimumPadding * 10),
    );
  }

  String _calculateReturns() {
    double principal = double.parse(principleController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);
    double totalAmountPayable = principal + (principal * roi * term) / 100;

    String result =
        'After $term years, your investment will be worth $totalAmountPayable $_currentItemSelected';
    return result;
  }

  void _reset() {
    principleController.text = '';
    roiController.text = '';
    termController.text = '';
    displayResult = '';
    _currentItemSelected = _currencies[0];
  }
}

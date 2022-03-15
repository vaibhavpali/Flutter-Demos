import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Stateful App Example",
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
  String nameCity = "";
  var _currencies = ['Rupees', 'AED', 'Pounds'];
  var _currentItemSelected = 'Rupees';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stateful App Widget"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (String inputValue) {
                setState(() {
                  nameCity = inputValue;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Text(
                "Your best city is $nameCity",
                style: const TextStyle(fontSize: 20.0),
              ),
            ),
            DropdownButton<String>(
              items: _currencies.map((String dropDownItem) {
                return DropdownMenuItem<String>(
                  value: dropDownItem,
                  child: Text(dropDownItem),
                );
              }).toList(),
              value: _currentItemSelected,
              onChanged: (String? selectedItem) {
                setState(() {
                  _onDropDownItemSelected(selectedItem!);
                });
              },
            )
          ],
        ),
      ),
    );
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      _currentItemSelected = newValueSelected;
    });
  }
}

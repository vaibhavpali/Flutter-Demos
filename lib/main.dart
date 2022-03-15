import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Stateful App Example",
    home: FavoriteCity(),
  ));
}

class FavoriteCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FavoriteCityState();
  }
}

class _FavoriteCityState extends State<FavoriteCity> {
  String nameCity = "";

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
             child: Text("Your best city is $nameCity"), 
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        child: const Text(
          "Vaibhav",
          textDirection: TextDirection.ltr,
          style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 75.0,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w700,
              color: Colors.white
          ),
        ),
        color: Colors.lightBlue,
        margin: const EdgeInsets.only(right: 30.0, bottom: 30.0),
        padding: const EdgeInsets.all(10.0),
      ),
    );
  }
}

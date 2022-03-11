import 'dart:math';

import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.orangeAccent,
      child: Center(
        child: Text(
          generateRandom(),
          textDirection: TextDirection.ltr,
          style: const TextStyle(color: Colors.brown, fontSize: 35.5),
        ),
      ),
    );
  }

  String generateRandom() {
    var randomNumber = Random().nextInt(100);
    return "You Number is $randomNumber";
  }
}

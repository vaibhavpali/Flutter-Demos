import 'package:flutter/material.dart';

import 'app_screens/RowColumn.dart';

// void main() => runApp(const MyFlutterApp());

// class MyFlutterApp extends StatelessWidget {
//   const MyFlutterApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: "My flutter App",
//         home: Scaffold(
//           appBar: AppBar(
//             title: const Text("My Flutter"),
//             backgroundColor: Colors.orange,
//           ),
//           body: const FirstScreen()
//         ));
//   }
// }

void main() {
  runApp(const MaterialApp(
    title: "Exploring UI Widget",
    home: RowColumn(),
  ));
}

import 'package:flutter/material.dart';

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

// void main() {
//   runApp(const MaterialApp(
//     title: "Exploring UI Widget",
//     home: RowColumn(),
//   ));
// }

// void main() {
//   runApp(MaterialApp(
//     title: "Exploring UI Widget",
//     home: Scaffold(
//       appBar: AppBar(
//         title: const Text("Basic List View"),
//       ),
//       body: getBasicListView(),
//     ),
//   ));
// }

void main() {
  runApp(MaterialApp(
    title: "Exploring UI Widget",
    home: Scaffold(
        appBar: AppBar(
          title: const Text("Basic List View"),
        ),
        body: getListView(),
  ),
  ));
}

List<String> getListItems() {
  return List<String>.generate(1000, (index) => "Item $index");
}

Widget getListView() {
  var listItems = getListItems();
  return ListView.builder(itemBuilder: (context, index) {
    return ListTile(
      title: Text(listItems[index]),
      subtitle: const Text("This is secondary item"),
      leading: const Icon(Icons.accessibility),
      onTap: () {
        debugPrint("${listItems[index]} is tapped");
      },
      trailing: const Icon(Icons.arrow_right),
    );
  });
}

Widget getBasicListView() {
  var listView = ListView(
    children: <Widget>[
      ListTile(
        leading: const Icon(Icons.landscape),
        title: const Text("Landscape"),
        subtitle: const Text("It's a beautiful view"),
        trailing: const Icon(Icons.sunny),
        onTap: () => debugPrint("Icon landscape clicked"),
      ),
      const ListTile(
        leading: Icon(Icons.phone),
        title: Text("My Phone"),
        subtitle: Text("It's a nice phone"),
      ),
      const ListTile(
        leading: Icon(Icons.email),
        title: Text("My email"),
        subtitle: Text("It's vaibhav@techno.com"),
      )
    ],
  );
  return listView;
}

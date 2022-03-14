import 'dart:ui';

import 'package:flutter/material.dart';

class RowColumn extends StatelessWidget {
  const RowColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 10.0, top: 40.0),
        child: Column(
          children: [
            Row(
              children: const [
                Expanded(
                    child: Text(
                  "Track1",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 35.0,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                )),
                Expanded(
                    child: Text(
                  "Title by Bryan Adams, performed in London",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 20.0,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ))
              ],
            ),
            Row(
              children: const [
                Expanded(
                    child: Text(
                  "Track 2",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 35.0,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                )),
                Expanded(
                    child: Text(
                  "Title by Cold play, performed in Norway",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 20.0,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ))
              ],
            ),
            const ImageClass(),
            const BookButton(),
          ],
        ),
        color: Colors.lightBlue,
      ),
    );
  }
}

class ImageClass extends StatelessWidget {
  const ImageClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage('images/my_pic.png');
    Image image = Image(
      image: assetImage,
      width: 250.0,
      height: 250.0,
    );
    return Container(margin: const EdgeInsets.only(top: 20.0), child: image);
  }
}

class BookButton extends StatelessWidget {
  const BookButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      height: 50.0,
      margin: const EdgeInsets.only(top: 30.0),
      child: ElevatedButton(
        onPressed: () => playSong(context),
        child: const Text("Submit",
            style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w700,
                color: Colors.white)),
      ),
    );
  }

  void playSong(BuildContext context) {
    var alertDialog = const AlertDialog(
      title: Text("Song played !!"),
      content: Text("This is Track1"),
    );

    showDialog(
        context: context, builder: (BuildContext context) => alertDialog);
  }
}

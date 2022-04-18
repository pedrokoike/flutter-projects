import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue.shade600,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: Center(
            child: Text(
              'Magic 8 Ball',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: magic8Ball(),
      ),
    ),
  );
}

class magic8Ball extends StatefulWidget {
  const magic8Ball({Key? key}) : super(key: key);

  @override
  State<magic8Ball> createState() => _magic8BallState();
}

class _magic8BallState extends State<magic8Ball> {
  int ballImage = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  ballImage = Random().nextInt(5) + 1;
                });
              },
              child: Image.asset('images/ball$ballImage.png'),
            ),
          ),
        ],
      ),
    );
  }
}

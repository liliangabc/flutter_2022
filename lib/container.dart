import 'package:flutter/material.dart';

Widget demo1 = Container(
  margin: const EdgeInsets.only(top: 50, left: 120),
  constraints: const BoxConstraints.tightFor(width: 200, height: 150),
  decoration: const BoxDecoration(
    gradient: RadialGradient(
      colors: [Colors.red, Colors.orange],
      center: Alignment.topLeft,
      radius: .98,
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black54,
        offset: Offset(2, 2),
        blurRadius: 4,
      )
    ],
  ),
  transform: Matrix4.rotationZ(.2),
  alignment: Alignment.center,
  child: const Text(
    '5.20',
    style: TextStyle(
      color: Colors.white,
      fontSize: 40,
    ),
  ),
);

void main(List<String> args) {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Container demo'),
        ),
        body: demo1,
      ),
    ),
  );
}

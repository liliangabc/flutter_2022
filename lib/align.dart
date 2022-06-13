import 'package:flutter/material.dart';

Widget demo1 = Container(
  height: 120,
  width: 120,
  color: Colors.blue.shade50,
  child: const Align(
    alignment: Alignment.topRight,
    child: FlutterLogo(
      size: 60,
    ),
  ),
);

Widget demo2 = Container(
  color: Colors.blue.shade50,
  child: const Align(
    widthFactor: 2.5,
    heightFactor: 2.5,
    alignment: Alignment.topRight,
    child: FlutterLogo(
      size: 60,
    ),
  ),
);

void main(List<String> args) {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Align Demo'),
        ),
        body: demo2,
      ),
    ),
  );
}

import 'dart:math';

import 'package:flutter/material.dart';

Widget demo1 = Container(
  color: Colors.black,
  margin: const EdgeInsets.all(50),
  child: Transform(
    alignment: Alignment.topRight,
    transform: Matrix4.skewY(0.3),
    child: Container(
      padding: const EdgeInsets.all(8),
      color: Colors.deepOrange,
      child: const Text('Apartment for rent!'),
    ),
  ),
);

Widget demo2 = Container(
  margin: const EdgeInsets.all(30),
  child: DecoratedBox(
    decoration: const BoxDecoration(
      color: Colors.red,
    ),
    child: Transform.translate(
      offset: const Offset(-20, -5),
      child: const Text('Hello World'),
    ),
  ),
);

Widget demo3 = Container(
  margin: const EdgeInsets.all(30),
  child: DecoratedBox(
    decoration: const BoxDecoration(
      color: Colors.red,
    ),
    child: Transform.rotate(
      angle: pi / 2,
      child: const Text('Hello World'),
    ),
  ),
);

Widget demo4 = Container(
  margin: const EdgeInsets.all(30),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.red,
        ),
        child: Transform.scale(
          scale: 1.5,
          child: const Text('Hello World'),
        ),
      ),
      const Text(
        '你好',
        style: TextStyle(
          color: Colors.green,
          fontSize: 18,
        ),
      ),
    ],
  ),
);

void main(List<String> args) {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('变换'),
        ),
        body: demo4,
      ),
    ),
  );
}

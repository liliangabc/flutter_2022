import 'package:flutter/material.dart';

Widget demo1 = ConstrainedBox(
  constraints: const BoxConstraints.expand(),
  child: Stack(
    alignment: Alignment.center,
    children: [
      Container(
        color: Colors.red,
        child: const Text(
          'Hello World',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      const Positioned(
        left: 18,
        child: Text('I am Jack'),
      ),
      const Positioned(
        top: 18,
        child: Text('Your friend'),
      ),
    ],
  ),
);

Widget demo2 = ConstrainedBox(
  constraints: const BoxConstraints.expand(),
  child: Stack(
    alignment: Alignment.center,
    fit: StackFit.expand,
    children: [
      const Positioned(
        left: 18,
        child: Text('I am Jack'),
      ),
      Container(
        color: Colors.red,
        child: const Text(
          'Hello World',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      const Positioned(
        top: 18,
        child: Text('Your friend'),
      ),
    ],
  ),
);

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Stack 布局'),
      ),
      body: demo2,
    ),
  ));
}

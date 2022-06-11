import 'package:flutter/material.dart';

Widget demo1 = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(' hello world '),
        Text(' I am Jack '),
      ],
    ),
    Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(' hello world '),
        Text(' I am Jack '),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
      textDirection: TextDirection.rtl,
      children: const [
        Text(' hello world '),
        Text(' I am Jack '),
      ],
    ),
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      verticalDirection: VerticalDirection.up,
      children: const [
        Text(
          ' hello world ',
          style: TextStyle(fontSize: 30),
        ),
        Text(' I am Jack '),
      ],
    ),
  ],
);

Widget demo2 = Container(
  color: Colors.green,
  child: Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('hello world'),
                Text('I am Jack'),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('线性布局'),
      ),
      body: demo2,
    ),
  ));
}

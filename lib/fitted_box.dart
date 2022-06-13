import 'package:flutter/material.dart';

Widget wContainer(BoxFit boxFit) {
  return Container(
    width: 50,
    height: 50,
    color: Colors.red,
    child: FittedBox(
      fit: boxFit,
      child: Container(
        width: 60,
        height: 70,
        color: Colors.blue,
      ),
    ),
  );
}

Widget demo1 = Center(
  child: Column(
    children: [
      wContainer(BoxFit.none),
      const Text('Wendux'),
      wContainer(BoxFit.contain),
      const Text('Flutter中国'),
    ],
  ),
);

void main(List<String> args) {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fitted box demo'),
        ),
        body: demo1,
      ),
    ),
  );
}

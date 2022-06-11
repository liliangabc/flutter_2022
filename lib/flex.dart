import 'package:flutter/material.dart';

Widget demo1 = Column(
  children: [
    Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 30,
            color: Colors.red,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 30,
            color: Colors.green,
          ),
        ),
      ],
    ),
    Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        height: 100,
        child: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: 30,
                color: Colors.red,
              ),
            ),
            const Spacer(flex: 1),
            Expanded(
              flex: 1,
              child: Container(
                height: 30,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    ),
  ],
);

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Flex布局'),
      ),
      body: demo1,
    ),
  ));
}

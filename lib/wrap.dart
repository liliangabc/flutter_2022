import 'package:flutter/material.dart';

Widget demo = Wrap(
  spacing: 8,
  runSpacing: 4,
  children: const [
    Chip(
      label: Text('Hamilton'),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Text('A'),
      ),
    ),
    Chip(
      label: Text('Lafayette'),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Text('L'),
      ),
    ),
    Chip(
      label: Text('Mulligan'),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Text('H'),
      ),
    ),
    Chip(
      label: Text('Laurens'),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Text('J'),
      ),
    ),
  ],
);

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Wrap 布局'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: demo,
      ),
    ),
  ));
}

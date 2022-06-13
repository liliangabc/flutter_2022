import 'package:flutter/material.dart';

Widget demo = DecoratedBox(
  decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.red, Colors.orange.shade700],
      ),
      borderRadius: BorderRadius.circular(3),
      boxShadow: const [
        BoxShadow(color: Colors.black54, offset: Offset(2, 2), blurRadius: 4)
      ]),
  child: const Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 80,
      vertical: 18,
    ),
    child: Text(
      'Login',
      style: TextStyle(color: Colors.white),
    ),
  ),
);

void main(List<String> args) {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('装饰'),
        ),
        body: demo,
      ),
    ),
  );
}

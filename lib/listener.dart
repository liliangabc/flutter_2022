import 'package:flutter/material.dart';

class PointerMoveTest extends StatefulWidget {
  const PointerMoveTest({Key? key}) : super(key: key);

  @override
  State<PointerMoveTest> createState() => _PointerMoveTestState();
}

class _PointerMoveTestState extends State<PointerMoveTest> {
  PointerEvent? _event;

  @override
  Widget build(BuildContext context) {
    return Listener(
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        width: 300,
        height: 150,
        child: Text(
          '${_event?.localPosition ?? ''}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      onPointerDown: (event) {
        setState(() {
          _event = event;
        });
      },
      onPointerMove: (event) {
        setState(() {
          _event = event;
        });
      },
      onPointerUp: (event) {
        setState(() {
          _event = event;
        });
      },
    );
  }
}

void main(List<String> args) {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: PointerMoveTest(),
      ),
    ),
  );
}

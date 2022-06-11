import 'package:flutter/material.dart';

Widget redBox = const DecoratedBox(
  decoration: BoxDecoration(
    color: Colors.red,
  ),
);

Widget demo1 = ConstrainedBox(
  constraints: const BoxConstraints(
    minWidth: double.infinity,
    minHeight: 50,
  ),
  child: SizedBox(
    height: 5,
    child: redBox,
  ),
);

Widget demo2 = SizedBox(
  width: 80,
  height: 80,
  child: redBox,
);

Widget demo3 = ConstrainedBox(
  constraints: const BoxConstraints.tightFor(
    width: 80,
    height: 80,
  ),
  child: redBox,
);

Widget demo4 = ConstrainedBox(
  constraints: const BoxConstraints(
    minWidth: 60,
    minHeight: 60,
  ),
  child: ConstrainedBox(
    constraints: const BoxConstraints(
      minWidth: 90,
      minHeight: 20,
    ),
    child: redBox,
  ),
);

Widget demo5 = ConstrainedBox(
  constraints: const BoxConstraints(
    minWidth: 60,
    minHeight: 100,
  ),
  child: UnconstrainedBox(
    child: ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 90,
        minHeight: 20,
      ),
      child: redBox,
    ),
  ),
);

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Constrained Box'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(
              right: 10,
            ),
            child: UnconstrainedBox(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation(Colors.white70),
                ),
              ),
            ),
          ),
        ],
      ),
      body: demo5,
    ),
  ));
}

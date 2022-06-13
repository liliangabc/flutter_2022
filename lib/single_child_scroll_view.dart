import 'package:flutter/material.dart';

class SingleChildScrollViewTestRoute extends StatelessWidget {
  const SingleChildScrollViewTestRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String str = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    return Scrollbar(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: str
                .split('')
                .map((e) => Text(
                      e,
                      textScaleFactor: 2,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

void main(List<String> args) {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('单子控件滚动视图'),
        ),
        body: const SingleChildScrollViewTestRoute(),
      ),
    ),
  );
}

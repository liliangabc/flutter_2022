import 'package:flutter/material.dart';

class Page extends StatefulWidget {
  const Page({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    print('build ${widget.text}');
    return Center(
      child: Text(widget.text, textScaleFactor: 5),
    );
  }
}

class PageViewTestToute extends StatelessWidget {
  const PageViewTestToute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    for (var i = 0; i < 6; i++) {
      children.add(Page(text: '$i'));
    }
    return PageView(
      // scrollDirection: Axis.vertical,
      allowImplicitScrolling: true,
      children: children,
    );
  }
}

void main(List<String> args) {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('页面视图'),
        ),
        body: const PageViewTestToute(),
      ),
    ),
  );
}

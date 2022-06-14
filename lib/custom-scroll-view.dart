import 'package:flutter/material.dart';

Widget buildTwoListView() {
  var listView = ListView.builder(
    itemCount: 20,
    itemBuilder: (_, index) => ListTile(title: Text('$index')),
  );
  return Column(
    children: [
      Expanded(child: listView),
      const Divider(color: Colors.grey),
      Expanded(child: listView),
    ],
  );
}

Widget buildTwoSliverList() {
  var listView = SliverFixedExtentList(
    itemExtent: 56,
    delegate: SliverChildBuilderDelegate(
        (_, index) => ListTile(title: Text('$index')),
        childCount: 10),
  );
  return CustomScrollView(
    slivers: [
      listView,
      listView,
    ],
  );
}

void main(List<String> args) {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('自定义滚动视图'),
        ),
        body: buildTwoSliverList(),
      ),
    ),
  );
}

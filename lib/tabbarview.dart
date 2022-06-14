import 'package:flutter/material.dart';

class TabViewRoute1 extends StatefulWidget {
  const TabViewRoute1({Key? key}) : super(key: key);

  @override
  State<TabViewRoute1> createState() => _TabViewRoute1State();
}

class _TabViewRoute1State extends State<TabViewRoute1>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List tabs = ['新闻', '历史', '图片'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('标签页视图'),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 5),
          );
        }).toList(),
      ),
    );
  }
}

class TabViewRoute2 extends StatelessWidget {
  const TabViewRoute2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List tabs = ['新闻', '历史', '图片'];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('App Name2'),
          bottom: TabBar(
            tabs: tabs.map((e) => Tab(text: e)).toList(),
          ),
        ),
        body: TabBarView(
          children: tabs.map((e) {
            return Container(
              alignment: Alignment.center,
              child: Text(e, textScaleFactor: 5),
            );
          }).toList(),
        ),
      ),
    );
  }
}

void main(List<String> args) {
  runApp(
    const MaterialApp(
      home: TabViewRoute2(),
    ),
  );
}

import 'package:flutter/material.dart';

class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  final int data;

  static ShareDataWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  }

  @override
  bool updateShouldNotify(ShareDataWidget old) {
    // TODO: implement updateShouldNotify
    return old.data != data;
  }
}

class _TestWidget extends StatefulWidget {
  const _TestWidget({Key? key}) : super(key: key);

  @override
  State<_TestWidget> createState() => __TestWidgetState();
}

class __TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(ShareDataWidget.of(context)!.data.toString());
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('Dependencies change');
  }
}

class InheritWidgetTestRoute extends StatefulWidget {
  const InheritWidgetTestRoute({Key? key}) : super(key: key);

  @override
  State<InheritWidgetTestRoute> createState() => _InheritWidgetTestRouteState();
}

class _InheritWidgetTestRouteState extends State<InheritWidgetTestRoute> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShareDataWidget(
        data: count,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: _TestWidget(),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  ++count;
                });
              },
              child: const Text('Increment'),
            )
          ],
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
          title: const Text('Inherited Widget'),
        ),
        body: const InheritWidgetTestRoute(),
      ),
    ),
  );
}

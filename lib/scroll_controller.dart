import 'package:flutter/material.dart';

class ScrollControllerTestRoute extends StatefulWidget {
  const ScrollControllerTestRoute({Key? key}) : super(key: key);

  @override
  State<ScrollControllerTestRoute> createState() =>
      _ScrollControllerTestRouteState();
}

class _ScrollControllerTestRouteState extends State<ScrollControllerTestRoute> {
  final _controller = ScrollController();
  bool showToTopBtn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && !showToTopBtn) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('滚动控制'),
      ),
      body: Scrollbar(
        controller: _controller,
        child: ListView.builder(
          itemCount: 100,
          itemExtent: 50,
          controller: _controller,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('$index'),
            );
          },
        ),
      ),
      floatingActionButton: showToTopBtn
          ? FloatingActionButton(
              onPressed: () {
                _controller.animateTo(
                  0,
                  duration: const Duration(microseconds: 200),
                  curve: Curves.ease,
                );
              },
              child: const Icon(Icons.arrow_upward),
            )
          : null,
    );
  }
}

class ScrollNotificationTestRoute extends StatefulWidget {
  const ScrollNotificationTestRoute({Key? key}) : super(key: key);

  @override
  State<ScrollNotificationTestRoute> createState() =>
      _ScrollNotificationTestRouteState();
}

class _ScrollNotificationTestRouteState
    extends State<ScrollNotificationTestRoute> {
  String _progress = '0%';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('滚动通知监听'),
      ),
      body: Scrollbar(
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            var progress = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;
            setState(() {
              _progress = '${(progress * 100).toInt()}%';
            });
            print('BottomEdge: ${notification.metrics.extentAfter == 0}');
            return false;
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              ListView.builder(
                itemCount: 100,
                itemExtent: 50,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('$index'),
                  );
                },
              ),
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.black54,
                child: Text(_progress),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void main(List<String> args) {
  runApp(
    const MaterialApp(
      home: ScrollNotificationTestRoute(),
    ),
  );
}

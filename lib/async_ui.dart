import 'package:flutter/material.dart';

Future<String> mockNetworkData() async {
  return Future.delayed(const Duration(seconds: 2), () => '我是从互联网上获取的数据');
}

class FutureBuilderRoute extends StatelessWidget {
  const FutureBuilderRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<String>(
        future: mockNetworkData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Text('Contents: ${snapshot.data}');
            }
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

Stream<int> counter() {
  return Stream.periodic(const Duration(seconds: 1), (i) => i);
}

class StreamBuilderRoute extends StatelessWidget {
  const StreamBuilderRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: counter(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Text('没有流');
          case ConnectionState.waiting:
            return const Text('等待数据。。。');
          case ConnectionState.active:
            return Text('active: ${snapshot.data}');
          case ConnectionState.done:
            return const Text('流已关闭');
        }
      },
    );
  }
}

void main(List<String> args) {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('FutureBuilder 和 StreamBuilder'),
        ),
        body: const StreamBuilderRoute(),
      ),
    ),
  );
}

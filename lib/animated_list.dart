import 'package:flutter/material.dart';

class AnimatedListRoute extends StatefulWidget {
  const AnimatedListRoute({Key? key}) : super(key: key);

  @override
  State<AnimatedListRoute> createState() => _AnimatedListRouteState();
}

class _AnimatedListRouteState extends State<AnimatedListRoute> {
  var data = <String>[];
  int counter = 5;

  final globalKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    // TODO: implement initState
    for (var i = 0; i < counter; i++) {
      data.add('${i + 1}');
    }
    super.initState();
  }

  onDelete(context, index) {
    setState(() {
      globalKey.currentState!.removeItem(
        index,
        (context, animation) {
          var item = buildItem(context, index);
          print('删除 ${data[index]}');
          data.removeAt(index);
          return FadeTransition(
            opacity: CurvedAnimation(
              parent: animation,
              curve: const Interval(0.5, 1.0),
            ),
            child: SizeTransition(
              sizeFactor: animation,
              axisAlignment: 0.0,
              child: item,
            ),
          );
        },
        duration: const Duration(microseconds: 200),
      );
    });
  }

  buildItem(context, index) {
    var char = data[index];
    return ListTile(
      key: ValueKey(char),
      title: Text(char),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => onDelete(context, index),
      ),
    );
  }

  buildAddBtn() {
    return Positioned(
      bottom: 30,
      left: 0,
      right: 0,
      child: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          data.add('${++counter}');
          globalKey.currentState!.insertItem(data.length - 1);
          print('添加 $counter');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedList(
          key: globalKey,
          initialItemCount: data.length,
          itemBuilder: (context, index, animation) {
            return FadeTransition(
              opacity: animation,
              child: buildItem(context, index),
            );
          },
        ),
        buildAddBtn(),
      ],
    );
  }
}

void main(List<String> args) {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('动画列表'),
        ),
        body: const AnimatedListRoute(),
      ),
    ),
  );
}

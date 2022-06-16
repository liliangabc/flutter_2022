import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureTest extends StatefulWidget {
  const GestureTest({Key? key}) : super(key: key);

  @override
  State<GestureTest> createState() => _GestureTestState();
}

class _GestureTestState extends State<GestureTest> {
  String _operation = 'No Gesture detected!';

  updateText(String text) {
    setState(() {
      _operation = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          width: 200,
          height: 100,
          child: Text(
            _operation,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        onTap: () => updateText('Tap'),
        onDoubleTap: () => updateText('DoubleTap'),
        onLongPress: () => updateText('LongPress'),
      ),
    );
  }
}

class _Drag extends StatefulWidget {
  const _Drag({Key? key}) : super(key: key);

  @override
  State<_Drag> createState() => __DragState();
}

class __DragState extends State<_Drag> with SingleTickerProviderStateMixin {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: const CircleAvatar(
              child: Text('A'),
            ),
            onPanDown: (e) {
              print('用户手指按下：${e.globalPosition}');
            },
            onPanUpdate: (e) {
              setState(() {
                _left += e.delta.dx;
                _top += e.delta.dy;
              });
            },
            // onVerticalDragUpdate: (e) {
            //   setState(() {
            //     _top += e.delta.dy;
            //   });
            // },
            onPanEnd: (e) {
              print(e.velocity);
            },
          ),
        ),
      ],
    );
  }
}

class _Scale extends StatefulWidget {
  const _Scale({Key? key}) : super(key: key);

  @override
  State<_Scale> createState() => __ScaleState();
}

class __ScaleState extends State<_Scale> {
  double _width = 200;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Image.asset(
          'images/1.jpg',
          width: _width,
        ),
        onScaleUpdate: (details) {
          setState(() {
            _width = 200 * details.scale.clamp(.8, 10);
          });
        },
      ),
    );
  }
}

class _GestureRecognizer extends StatefulWidget {
  const _GestureRecognizer({Key? key}) : super(key: key);

  @override
  State<_GestureRecognizer> createState() => __GestureRecognizerState();
}

class __GestureRecognizerState extends State<_GestureRecognizer> {
  final _tapGestureRecognizer = TapGestureRecognizer();
  bool _toggle = false;

  @override
  void dispose() {
    // TODO: implement dispose
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(children: [
          const TextSpan(text: '你好世界'),
          TextSpan(
            text: '点我变色',
            style: TextStyle(
              fontSize: 30,
              color: _toggle ? Colors.blue : Colors.red,
            ),
            recognizer: _tapGestureRecognizer
              ..onTap = () {
                setState(() {
                  _toggle = !_toggle;
                });
              },
          ),
          const TextSpan(text: '你好世界'),
        ]),
      ),
    );
  }
}

void main(List<String> args) {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('手势检测'),
        ),
        body: const _GestureRecognizer(),
      ),
    ),
  );
}

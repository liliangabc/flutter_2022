import 'package:flutter/material.dart';

class ClipTestWidget extends StatelessWidget {
  const ClipTestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget avatar = Image.asset(
      'images/avatar.png',
      width: 60,
    );
    return Center(
      child: Column(
        children: [
          avatar,
          ClipOval(
            child: avatar,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: avatar,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                widthFactor: .5,
                child: avatar,
              ),
              const Text(
                '你好世界',
                style: TextStyle(color: Colors.green),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRect(
                child: Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5,
                  child: avatar,
                ),
              ),
              const Text(
                '你好世界',
                style: TextStyle(color: Colors.green),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  getClip(Size size) {
    // TODO: implement getClip
    return const Rect.fromLTWH(10, 15, 40, 30);
  }

  @override
  shouldReclip(covariant CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

Widget customClipTestWidget = DecoratedBox(
  decoration: const BoxDecoration(
    color: Colors.red,
  ),
  child: ClipRect(
    clipper: MyClipper(),
    child: Image.asset(
      'images/avatar.png',
      width: 60,
    ),
  ),
);

void main(List<String> args) {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Clip demo'),
        ),
        body: customClipTestWidget,
      ),
    ),
  );
}

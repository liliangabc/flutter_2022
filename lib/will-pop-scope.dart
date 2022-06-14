import 'package:flutter/material.dart';

class WillPopScopeTestRoute extends StatefulWidget {
  const WillPopScopeTestRoute({Key? key}) : super(key: key);

  @override
  State<WillPopScopeTestRoute> createState() => _WillPopScopeTestRouteState();
}

class _WillPopScopeTestRouteState extends State<WillPopScopeTestRoute> {
  DateTime? _lastPressedAt;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Container(
        alignment: Alignment.center,
        child: const Text('1秒内连续按两次返回键退出'),
      ),
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt!) >
                const Duration(seconds: 1)) {
          _lastPressedAt = DateTime.now();
          return false;
        }
        return true;
      },
    );
  }
}

void main(List<String> args) {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: WillPopScopeTestRoute(),
      ),
    ),
  );
}

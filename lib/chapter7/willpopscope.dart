import 'package:flutter/material.dart';

class WillPopScopeTestRoute extends StatefulWidget {
  const WillPopScopeTestRoute({super.key});

  @override
  WillPopScopeTestRouteState createState() {
    return WillPopScopeTestRouteState();
  }
}

class WillPopScopeTestRouteState extends State<WillPopScopeTestRoute> {
  DateTime? _lastPressedAt; //上次点击时间

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (context, result) async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt!) >
                const Duration(seconds: 1)) {
          //两次点击间隔超过1秒则重新计时
          _lastPressedAt = DateTime.now();
        }
      },
      child: Container(
        alignment: Alignment.center,
        child: const Text("1秒内连续按两次返回键退出"),
      ),
    );
  }
}

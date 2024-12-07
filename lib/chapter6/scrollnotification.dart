import 'package:flutter/material.dart';

class ScrollNotificationTestRoute extends StatefulWidget {
  const ScrollNotificationTestRoute({super.key});

  @override
  State<ScrollNotificationTestRoute> createState() =>
      _ScrollNotificationTestRouteState();
}

class _ScrollNotificationTestRouteState
    extends State<ScrollNotificationTestRoute> {
  String _progress = "0%"; //保存进度百分比

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      //进度条
      // 监听滚动通知
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          double progress = notification.metrics.pixels /
              notification.metrics.maxScrollExtent;
          //重新构建
          setState(() {
            _progress = "${(progress * 100).toInt()}%";
          });
          print("BottomEdge: ${notification.metrics.extentAfter == 0}");
          return false;
          //return true; //放开此行注释后，进度条将失效
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ListView.builder(
              itemCount: 100,
              itemExtent: 50.0,
              itemBuilder: (context, index) => ListTile(title: Text("$index")),
            ),
            CircleAvatar(
              //显示进度百分比
              radius: 30.0,
              backgroundColor: Colors.black54,
              child: Text(_progress),
            )
          ],
        ),
      ),
    );
  }
}

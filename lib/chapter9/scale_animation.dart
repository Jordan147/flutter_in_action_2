import 'package:flutter/material.dart';

class ScaleAnimationRoute extends StatefulWidget {
  const ScaleAnimationRoute({super.key});

  @override
  State<ScaleAnimationRoute> createState() => _ScaleAnimationRouteState();
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    //匀速
    //图片宽高从0变到300
    animation = Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener(() {
        setState(() => {});
      });

//    //使用弹性曲线
//    animation=CurvedAnimation(parent: controller, curve: Curves.bounceIn);
//    //图片宽高从0变到300
//    animation =  Tween(begin: 0.0, end: 300.0).animate(animation)
//      ..addListener(() {
//        setState(() {
//        });
//      });

    //启动动画(正向执行)
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "imgs/avatar.png",
        width: animation.value,
        height: animation.value,
      ),
    );
  }

  @override
  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}

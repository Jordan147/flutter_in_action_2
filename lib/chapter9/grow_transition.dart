import 'package:flutter/material.dart';

class GrowTransition extends StatelessWidget {
  const GrowTransition({
    super.key,
    required this.animation,
    this.child,
  });

  final Widget? child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, child) {
          return SizedBox(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}

class GrowTransitionRoute extends StatefulWidget {
  const GrowTransitionRoute({super.key});

  @override
  State<GrowTransitionRoute> createState() => _GrowTransitionRouteState();
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _GrowTransitionRouteState extends State<GrowTransitionRoute>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween(begin: 0.0, end: 300.0).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GrowTransition(
      animation: animation,
      child: Image.asset("imgs/avatar.png"),
    );
  }

  @override
  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}

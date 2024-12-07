import 'package:flutter/material.dart';

class StackRoute extends StatelessWidget {
  const StackRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
        clipBehavior: Clip.hardEdge,
        children: <Widget>[
          Container(
            color: Colors.red,
            child: const Text(
              "Hello world",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const Positioned(
            left: 18.0,
            child: Text("I am Jack"),
          ),
          const Positioned(
            top: 18.0,
            child: Text("Your friend"),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ConstraintsTest extends StatelessWidget {
  const ConstraintsTest({super.key});

  @override
  Widget build(BuildContext context) {
    var container = Container(width: 200, height: 200, color: Colors.red);
    return UnconstrainedBox(
      child: container,
    );
    // return Align(
    //   child: container,
    //   alignment: Alignment.topLeft,
    // );
    // return CustomSizedBox(
    //   width: 200,
    //   height: 200,
    //   child: Container(color: Colors.green,),
    // );
  }
}

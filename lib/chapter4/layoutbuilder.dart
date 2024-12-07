import 'package:flutter/material.dart';
import '../common.dart';

class ResponsiveColumn extends StatelessWidget {
  const ResponsiveColumn({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 200) {
          return Column(mainAxisSize: MainAxisSize.min, children: children);
        } else {
          var _children = <Widget>[];
          for (var i = 0; i < children.length; i += 2) {
            if (i + 1 < children.length) {
              _children.add(Row(
                mainAxisSize: MainAxisSize.min,
                children: [children[i], children[i + 1]],
              ));
            } else {
              _children.add(children[i]);
            }
          }
          return Column(mainAxisSize: MainAxisSize.min, children: _children);
        }
      },
    );
  }
}

class LayoutBuilderRoute extends StatelessWidget {
  const LayoutBuilderRoute({super.key});

  @override
  Widget build(BuildContext context) {
    // return LayoutLogPrint(child:Text("xx"*20000));
    var _children = List.filled(6, const Text("A"));
    // Column在本示例中在水平方向的最大宽度为屏幕的宽度
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: 190, child: ResponsiveColumn(children: _children)),
        ResponsiveColumn(children: _children),
        const LayoutLogPrint(child: Text("flutter@wendux")),
        //CustomSingleChildLayout
      ],
    );
  }
}

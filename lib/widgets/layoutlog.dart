import 'package:flutter/widgets.dart';

class LayoutLogPrint<T> extends StatelessWidget {
  const LayoutLogPrint({
    super.key,
    this.tag,
    this.debugPrint = print,
    required this.child,
  });

  final Widget child;
  final Function(Object? object) debugPrint;
  final T? tag;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      assert(() {
        debugPrint('${tag ?? key ?? child.runtimeType}: $constraints');
        return true;
      }());
      return child;
    });
  }
}

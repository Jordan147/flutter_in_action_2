import 'package:flutter/material.dart';
import '../common.dart';

class SliverPersistentHeaderToBoxRoute extends StatelessWidget {
  const SliverPersistentHeaderToBoxRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        buildSliverList(5),
        SliverPersistentHeaderToBox.builder(builder: headerBuilder),
        buildSliverList(5),
        SliverPersistentHeaderToBox(child: wTitle('Title 2')),
        buildSliverList(50),
      ],
    );
  }

  // 当 header 固定后显示阴影
  Widget headerBuilder(context, maxExtent, fixed) {
    // 获取当前应用主题，关于主题相关内容将在后面章节介绍，现在
    // 我们要从主题中获取一些颜色
    var theme = Theme.of(context);
    return Material(
      elevation: fixed ? 4 : 0,
      shadowColor: theme.appBarTheme.shadowColor,
      child: Container(
        color: fixed ? Colors.white : theme.canvasColor,
        child: wTitle('Title 1'),
      ),
    );
  }

  // 我们约定小写字母 w 开头的函数代表是需要构建一个 Widget，这比 buildXX 会更简洁
  Widget wTitle(String text) =>
      ListTile(title: Text(text), onTap: () => print(text));
}

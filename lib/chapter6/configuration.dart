import 'package:flutter/material.dart';

class ScrollViewConfiguration extends StatefulWidget {
  const ScrollViewConfiguration({super.key});

  @override
  State<ScrollViewConfiguration> createState() =>
      _ScrollViewConfigurationState();
}

class _ScrollViewConfigurationState extends State<ScrollViewConfiguration> {
  bool reverse = false;
  bool vertical = true;
  ScrollPhysics physics = const ScrollPhysics();

  @override
  Widget build(BuildContext context) {
    Widget list = ListView.builder(
      reverse: reverse,
      scrollDirection: vertical ? Axis.vertical : Axis.horizontal,
      // controller:  ,
      //physics:  ObserveOverscrollPhysics((e)=>print(e)),
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Text(
            '$index',
            textScaler: const TextScaler.linear(2),
          )),
        );
      },
    );

    return Column(children: [
      Expanded(child: list),
      wConfigurationPanel(),
    ]);
  }

  Widget wConfigurationPanel() {
    return ListView(
      shrinkWrap: true,
      children: [
        CheckboxListTile(
          value: reverse,
          title: const Text('反向'),
          onChanged: (v) => setState(() => reverse = v!),
        ),
        CheckboxListTile(
          value: vertical,
          title: const Text('Vertical(滚动方向)'),
          onChanged: (v) => setState(() => vertical = v!),
        ),
      ],
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';

class FutureAndStreamBuilderRoute extends StatefulWidget {
  const FutureAndStreamBuilderRoute({super.key});

  @override
  State<FutureAndStreamBuilderRoute> createState() =>
      _FutureAndStreamBuilderRouteState();
}

class _FutureAndStreamBuilderRouteState
    extends State<FutureAndStreamBuilderRoute> {
  late Future<String> _future;

  @override
  void initState() {
    _future = mockNetworkData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<String>(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print(snapshot.connectionState);
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else {
              return Text("Contents: ${snapshot.data}");
            }
          } else {
            //
            return const CircularProgressIndicator();
          }
        },
      ),
    );
    // return Center(
    //   child: StreamBuilder<int>(
    //     stream: counter(), //
    //     //initialData: ,// a Stream<int> or null
    //     builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
    //       if (snapshot.hasError) return Text('Error: ${snapshot.error}');
    //       switch (snapshot.connectionState) {
    //         case ConnectionState.none:
    //           return Text('没有Stream');
    //         case ConnectionState.waiting:
    //           return Text('等待数据...');
    //         case ConnectionState.active:
    //           return Text('active: ${snapshot.data}');
    //         case ConnectionState.done:
    //           return Text('Stream已关闭');
    //       }
    //     },
    //   ),
    // );
  }

  Future<String> mockNetworkData() async {
    return Future.delayed(const Duration(seconds: 3), () => "我是从互联网上获取的数据");
  }

  Stream<int> counter() {
    return Stream.periodic(const Duration(seconds: 1), (i) {
      return i;
    });
  }
}

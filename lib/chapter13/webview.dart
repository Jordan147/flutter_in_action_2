import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewTest extends StatefulWidget {
  const WebViewTest({Key? key}) : super(key: key);

  @override
  State<WebViewTest> createState() => _WebViewTestState();
}

class _WebViewTestState extends State<WebViewTest> {
  // late WebViewController _controller;

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: WebView(
  //       initialUrl: 'https://m.baidu.com',
  //       onWebViewCreated: (controller) => _controller = controller,
  //       onProgress: (progress) => print(progress),
  //       onPageStarted: (url) => print('start loading: $url'),
  //       onPageFinished: (url) => print('load finished:$url'),
  //       onWebResourceError: (err) => print(err.description),
  //       javascriptChannels: <JavascriptChannel>{
  //         _toasterJavascriptChannel(context),
  //       },
  //     ),
  //   );
  // }

  // JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
  //   return JavascriptChannel(
  //     name: 'Toaster',
  //     onMessageReceived: (JavascriptMessage message) {
  //       // ignore: deprecated_member_use
  //       Scaffold.of(context).showSnackBar(
  //         SnackBar(content: Text(message.message)),
  //       );
  //     },
  //   );
  // }

  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) => debugPrint('start loading: $url'),
        onPageFinished: (url) => debugPrint('load finished:$url'),
        onWebResourceError: (err) => debugPrint(err.description),
      ))
      ..loadRequest(Uri.parse('https://m.baidu.com'));
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: controller,
    );
  }

  // Example 1
  // late final WebViewController controller;

  // @override
  // void initState() {
  //   super.initState();
  //   controller = WebViewController()
  //     ..loadRequest(
  //       Uri.parse('https://flutter.dev'),
  //     );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Flutter WebView'),
  //     ),
  //     body: WebViewWidget(
  //       controller: controller,
  //     ),
  //   );
  // }

  // Example 2 Listen webpage
  // var loadingPercentage = 0;
  // late final WebViewController controller;

  // @override
  // void initState() {
  //   super.initState();
  //   controller = WebViewController()
  //     ..setNavigationDelegate(NavigationDelegate(
  //       onPageStarted: (url) {
  //         setState(() {
  //           loadingPercentage = 0;
  //         });
  //       },
  //       onProgress: (progress) {
  //         setState(() {
  //           loadingPercentage = progress;
  //         });
  //       },
  //       onPageFinished: (url) {
  //         setState(() {
  //           loadingPercentage = 100;
  //         });
  //       },
  //     ))
  //     ..loadRequest(
  //       Uri.parse('https://flutter.dev'),
  //     );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Stack(
  //     children: [
  //       WebViewWidget(
  //         controller: controller,
  //       ),
  //       if (loadingPercentage < 100)
  //         LinearProgressIndicator(
  //           value: loadingPercentage / 100.0,
  //         ),
  //     ],
  //   );
  // }
}

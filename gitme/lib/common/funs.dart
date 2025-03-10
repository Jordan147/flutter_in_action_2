import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget gmAvatar(
  String url, {
  double width = 30,
  double? height,
  BoxFit? fit,
  BorderRadius? borderRadius,
}) {
  var placeholder = Image.asset("imgs/avatar-default.png", //头像占位图
      width: width,
      height: height);
  return ClipRRect(
    borderRadius: borderRadius ?? BorderRadius.circular(2),
    child: CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => placeholder,
      errorWidget: (context, url, error) => placeholder,
    ),
  );
}

void showToast(
  String text, {
  gravity = ToastGravity.CENTER,
  toastLength = Toast.LENGTH_SHORT,
}) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.grey[600],
    fontSize: 16.0,
  );
}

void showLoading(context, [String? text]) {
  String text1 = text ?? "Loading...";
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3.0),
                boxShadow: const [
                  //阴影
                  BoxShadow(
                    color: Colors.black12,
                    //offset: Offset(2.0,2.0),
                    blurRadius: 10.0,
                  )
                ]),
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            constraints: const BoxConstraints(minHeight: 120, minWidth: 180),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    text1,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

import 'dart:convert';
// import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../index.dart';

// 提供四套可选主题色
const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
];

class Global {
  static late SharedPreferences _prefs;
  static Profile profile = Profile();
  // 网络缓存对象
  static NetCache netCache = NetCache();

  // 可选的主题列表
  static List<MaterialColor> get themes => _themes;

  // 是否为release版
  static bool get isRelease => const bool.fromEnvironment("dart.vm.product");

  //初始化全局信息
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    _prefs = await SharedPreferences.getInstance();
    var vProfile = _prefs.getString("profile");
    if (vProfile != null) {
      try {
        profile = Profile.fromJson(jsonDecode(vProfile));
      } catch (e) {
        print(e);
      }
    } else {
      // 默认主题索引为0，代表蓝色
      profile = Profile()..theme = 0;
    }

    // 如果没有缓存策略，设置默认缓存策略
    profile.cache = profile.cache ?? CacheConfig()
      ..enable = true
      ..maxAge = 3600
      ..maxCount = 100;

    //初始化网络请求相关配置
    Git.init();
  }

  // 持久化Profile信息
  static saveProfile() =>
      _prefs.setString("profile", jsonEncode(profile.toJson()));
}

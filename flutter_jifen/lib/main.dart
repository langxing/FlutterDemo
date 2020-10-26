import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_jifen/page/page_main.dart';
import 'package:flutter_jifen/page/page_tag_products/page_tag_products.dart';
import 'package:flutter_jifen/utlis/router_manager.dart';
import 'package:provider/provider.dart';

import 'http/dio.dart';

void main() {
  /// 为了解决泛型不一致的问题
  /// https://github.com/rrousselGit/provider/issues/154
  Provider.debugCheckInvalidValueType = null;
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  //Fiddler抓包设置代理
//  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client){
//    client.findProxy = (url){
//      return "PROXY 10.8.0.236:8888";
//    };
//    //抓Https包设置
//    client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
//  };
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
      onGenerateRoute: (settings) {
        final dynamic params = settings.arguments;
        if (settings.name == TagProductsPage.PAGE_NAME) {
          debugPrint("title：${params[TagProductsPage.PARAMS_TITLE]}");
          return MaterialPageRoute(
              builder: (context) => TagProductsPage(
                title: params[TagProductsPage.PARAMS_TITLE],
                tagId: params[TagProductsPage.PARMAS_TAGID],
                type: params[TagProductsPage.PARAMS_TYPE],
              )
          );
        }
        return null;
      },
    );
  }
}


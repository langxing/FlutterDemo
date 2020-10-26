import 'dart:collection';
import 'dart:convert';
import 'dart:math';
import 'package:dio/dio.dart';
import 'business_exception.dart';
import 'package:crypto/crypto.dart';

class CustomInterceptor extends Interceptor {
  final key = "YJypjEbnymXpRHINeQGVxUhpQXjVgQNk";

  final randomSource = "ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz";

  String _randomString(int length) {
    String result = "";
    final random = Random(DateTime
        .now()
        .millisecondsSinceEpoch);
    for (var i = 0; i < length; i++) {
      var randomIndex = random.nextInt(randomSource.length);
      result += randomSource[randomIndex];
    }

    return result;
  }

  @override
  Future onRequest(RequestOptions options) async {
    if (options.data is List<String>) {
      throw DioError(error: "Can't send List to sever directly");
    }
    final SplayTreeMap<String, dynamic> requestOption = SplayTreeMap<
        String,
        dynamic>();
    final token = "OTE0ZUZTbjNUek1ZSzk4cllMdHZjTVJlazE4ZzM5ejIvNUJEdGQ5M0thUHQycHUvbnVsbGovOW96M2RtZnFub05aUmFNcllvOHMrb0pQdjdWVDB0Mk5OS0orYnhYWkJyOEVOdkhaUys5S09jMUlCV0ZJZ01WZVdZNVMyOE5wVCttVjhOUkFsSkt4bE1yVkM4Tm43aTNsdmQxYUtwUFp6Tkt2anFtdlhHWnVhR0lBOg";
    requestOption["token"] = token;
    // 1app，2小程序
    requestOption['app_type'] = 1;
    requestOption["req_msg_id"] = _randomString(6) + DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();

    final optionData = options.data;
    if (optionData is Map) {
      optionData.forEach((key, value) {
        requestOption[key.toString()] = value.toString();
      });
    }
    String sign = "";
    requestOption.forEach((key, value) {
      sign += '$key=$value&';
    });
    sign += "key=$key";

    sign = md5.convert(utf8.encode(sign)).toString().toUpperCase();

    requestOption["sign"] = sign;

    options.data = requestOption;

    options.headers["connection"] = "Keep-Alive";
    options.headers["accept"] = "application/json, text/plain, */*";
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) async {
    // 将返回数据转化为json字符串
    final data = json.decode(response.toString());
    // 错误返回数据转换为BusinessException再返回
    if (data["code"] == 0) {
      return data;
    } else {
      return dio.reject(BusinessException(data["code"], data["msg"]));
    }
  }

}

final dio = Dio(
  BaseOptions(
    connectTimeout: 15000,
    receiveTimeout: 15000,
    baseUrl: "http://uapp.tastes.net.cn/"
  )
)
..interceptors.add(LogInterceptor())
..interceptors.add(CustomInterceptor());





import 'package:dio/dio.dart';
// 请求错误对象
class BusinessException extends DioError {
  final int code;
  final String message;

  BusinessException(this.code, this.message);
}
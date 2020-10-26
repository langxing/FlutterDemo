
import 'package:dio/dio.dart';
import 'package:flutter_jifen/data/mine_order_statistic_count_resp.dart';
import 'package:flutter_jifen/data/user_info.dart';
import 'package:retrofit/http.dart';

part 'mine_service.g.dart';

@RestApi()
abstract class MineService {
  factory MineService(Dio dio, {String baseUrl}) = _MineService;

  ///查询用户信息
  @POST("/jifen/user/info/index")
  @FormUrlEncoded()
  Future<UserInfo> queryUserInfo();

  ///订单统计数据
  @FormUrlEncoded()
  @POST("/jifen/order/statistic/index")
  Future<MineOrderStatisticCountResp> queryOrderStatistic();
}
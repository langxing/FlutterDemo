import 'package:dio/dio.dart';
import 'package:flutter_jifen/data/heom_special_resp.dart';
import 'package:flutter_jifen/data/home_activity.dart';
import 'package:flutter_jifen/data/home_banner.dart';
import 'package:flutter_jifen/data/home_menu.dart';
import 'package:flutter_jifen/data/home_product_resp.dart';
import 'package:flutter_jifen/data/home_special_area.dart';
import 'package:retrofit/retrofit.dart';

part 'home_service.g.dart';

@RestApi()
abstract class HomeService {
  factory HomeService(Dio dio, {String baseUrl}) = _HomeService;

  ///获取banner
  @POST("jifen/mall/info/banner")
  @FormUrlEncoded()
  Future<HomeBanner> loadHomeBanner(@Field("position") int position);

  ///获取金刚区数据
  @POST("jifen/market/active/icon")
  @FormUrlEncoded()
  Future<HomeMenu> loadHomeMenu();

  @POST("jifen/market/active/topic")
  @FormUrlEncoded()
  Future<HomeSpecialArea> loadHomeTopicMenus();

  @POST("jifen/market/active/special")
  @FormUrlEncoded()
  Future<HomeSpecialResp> loadHomeSpecialList();

  ///获取活动图片
  @POST("jifen/market/special/index")
  @FormUrlEncoded()
  Future<HomeActivity> loadHomeActivity();

  ///加载底部商品列表
  @POST("jifen/market/active/productlist")
  @FormUrlEncoded()
  Future<HomeProductResp> loadProductList(@Body() Map<String, dynamic> map);

  ///获取金刚区商品列表
  @POST("/jifen/market/active/productlist")
  @FormUrlEncoded()
  Future<HomeProductResp> loadProducts(@Body() Map<String, dynamic> map);

  ///首页搜索商品
  @POST("/jifen/product/info/list")
  @FormUrlEncoded()
  Future<HomeProductResp> querySearchList(@Body() Map<String, dynamic> map);
}
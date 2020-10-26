import 'package:dio/dio.dart';
import 'package:flutter_jifen/data/base_resp.dart';
import 'package:flutter_jifen/data/cart_list_count_resp.dart';
import 'package:flutter_jifen/data/cart_list_resp.dart';
import 'package:flutter_jifen/data/cart_order_confirm_resp.dart';
import 'package:retrofit/http.dart';

part 'cart_service.g.dart';

@RestApi()
abstract class CartService {
  factory CartService(Dio dio, {String baseUrl}) = _CartService;

  @POST("/jifen/product/cart/info")
  @FormUrlEncoded()
  Future<CartListResp> loadCartList();

  @POST("/jifen/product/cart/edit")
  @FormUrlEncoded()
  Future<BaseResp> updateCartList(
      @Field("cart_id") String cartId,
      @Field("number") int number,
      );

  @POST("/jifen/product/cart/delete")
  @FormUrlEncoded()
  Future<BaseResp> deleteCartList(
      @Field("cart_ids") String cartId
      );

  @POST("/jifen/product/cart/add")
  @FormUrlEncoded()
  Future<BaseResp> addCartList(
      @Field("sku_id") String skuId,
      @Field("number") int number,
      );

  @POST("/jifen/mall/index/cart_count")
  @FormUrlEncoded()
  Future<CartListCountResp> loadCartListCount();

  @POST("/jifen/order/info/confirm")
  @FormUrlEncoded()
  Future<CartOrderConfirmResp> loadConfirmOrderTotal(
      @Field("cart_ids") String cartId,
      @Field("sku_id") String skuId,
      @Field("number") int number,
      @Field("order_id") String orderId,
      @Field("db_address_id") String addressId,
      );
}
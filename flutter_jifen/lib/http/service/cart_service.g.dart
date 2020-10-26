// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _CartService implements CartService {
  _CartService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  loadCartList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/jifen/product/cart/info',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded',
            baseUrl: baseUrl),
        data: _data);
    final value = CartListResp.fromJson(_result.data);
    return value;
  }

  @override
  updateCartList(cartId, number) async {
    ArgumentError.checkNotNull(cartId, 'cartId');
    ArgumentError.checkNotNull(number, 'number');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'cart_id': cartId, 'number': number};
    _data.removeWhere((k, v) => v == null);
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/jifen/product/cart/edit',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded',
            baseUrl: baseUrl),
        data: _data);
    final value = BaseResp.fromJson(_result.data);
    return value;
  }

  @override
  deleteCartList(cartId) async {
    ArgumentError.checkNotNull(cartId, 'cartId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'cart_ids': cartId};
    _data.removeWhere((k, v) => v == null);
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/jifen/product/cart/delete',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded',
            baseUrl: baseUrl),
        data: _data);
    final value = BaseResp.fromJson(_result.data);
    return value;
  }

  @override
  addCartList(skuId, number) async {
    ArgumentError.checkNotNull(skuId, 'skuId');
    ArgumentError.checkNotNull(number, 'number');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'sku_id': skuId, 'number': number};
    _data.removeWhere((k, v) => v == null);
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/jifen/product/cart/add',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded',
            baseUrl: baseUrl),
        data: _data);
    final value = BaseResp.fromJson(_result.data);
    return value;
  }

  @override
  loadCartListCount() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/jifen/mall/index/cart_count',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded',
            baseUrl: baseUrl),
        data: _data);
    final value = CartListCountResp.fromJson(_result.data);
    return value;
  }

  @override
  loadConfirmOrderTotal(cartId, skuId, number, orderId, addressId) async {
    ArgumentError.checkNotNull(cartId, 'cartId');
    ArgumentError.checkNotNull(skuId, 'skuId');
    ArgumentError.checkNotNull(number, 'number');
    ArgumentError.checkNotNull(orderId, 'orderId');
    ArgumentError.checkNotNull(addressId, 'addressId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {
      'cart_ids': cartId,
      'sku_id': skuId,
      'number': number,
      'order_id': orderId,
      'db_address_id': addressId
    };
    _data.removeWhere((k, v) => v == null);
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/jifen/order/info/confirm',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded',
            baseUrl: baseUrl),
        data: _data);
    final value = CartOrderConfirmResp.fromJson(_result.data);
    return value;
  }
}

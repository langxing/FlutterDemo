// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_list_count_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartListCountResp _$CartListCountRespFromJson(Map<String, dynamic> json) {
  return CartListCountResp(
    json['result'] as bool,
    json['code'] as int,
    json['msg'] as String,
    json['data'] == null
        ? null
        : CartListCountData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CartListCountRespToJson(CartListCountResp instance) =>
    <String, dynamic>{
      'result': instance.result,
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

CartListCountData _$CartListCountDataFromJson(Map<String, dynamic> json) {
  return CartListCountData(
    json['cart_count'] as String,
  );
}

Map<String, dynamic> _$CartListCountDataToJson(CartListCountData instance) =>
    <String, dynamic>{
      'cart_count': instance.cartCount,
    };

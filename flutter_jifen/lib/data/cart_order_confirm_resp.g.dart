// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_order_confirm_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartOrderConfirmResp _$CartOrderConfirmRespFromJson(Map<String, dynamic> json) {
  return CartOrderConfirmResp(
    json['result'] as bool,
    json['code'] as int,
    json['msg'] as String,
    json['data'] == null
        ? null
        : CartOrderConfirmData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CartOrderConfirmRespToJson(
        CartOrderConfirmResp instance) =>
    <String, dynamic>{
      'result': instance.result,
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

CartOrderConfirmData _$CartOrderConfirmDataFromJson(Map<String, dynamic> json) {
  return CartOrderConfirmData(
    (json['list'] as List)
        ?.map((e) => e == null
            ? null
            : CartOrderConfirmItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['jifen_balance'] as String,
    json['total_price'] as int,
    json['total_jifen'] as int,
    json['shipping_price'] as String,
    json['pay_price'] as int,
  );
}

Map<String, dynamic> _$CartOrderConfirmDataToJson(
        CartOrderConfirmData instance) =>
    <String, dynamic>{
      'list': instance.list,
      'jifen_balance': instance.jifenBalance,
      'total_price': instance.totalPrice,
      'total_jifen': instance.totalJifen,
      'shipping_price': instance.shippingPrice,
      'pay_price': instance.payPrice,
    };

CartOrderConfirmItem _$CartOrderConfirmItemFromJson(Map<String, dynamic> json) {
  return CartOrderConfirmItem(
    json['supplier_id'] as String,
    json['supplier_name'] as String,
    json['supplier_img'] as String,
    json['total_price'] as int,
    json['total_jifen'] as int,
    json['shipping_price'] as int,
    json['pay_price'] as int,
    (json['sku_list'] as List)
        ?.map((e) =>
            e == null ? null : CartSkuItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['cargo_params'],
    DataCheckWrapper.stringFromDynamic(json['use_shipping_coupon_id']),
    DataCheckWrapper.intFromDynamic(json['use_shipping_coupon_price']),
    DataCheckWrapper.stringFromDynamic(json['discount_jifen']),
    (json['discount_list'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$CartOrderConfirmItemToJson(
        CartOrderConfirmItem instance) =>
    <String, dynamic>{
      'supplier_id': instance.supplierId,
      'supplier_name': instance.supplierName,
      'supplier_img': instance.supplierImg,
      'total_price': instance.totalPrice,
      'total_jifen': instance.totalJifen,
      'shipping_price': instance.shippingPrice,
      'pay_price': instance.payPrice,
      'sku_list': instance.skuCartOrderConfirmItem,
      'cargo_params': instance.cargoParams,
      'use_shipping_coupon_id': instance.useShippingCouponId,
      'use_shipping_coupon_price': instance.useShippingCouponPrice,
      'discount_jifen': instance.discountJiFen,
      'discount_list': instance.discountList,
    };

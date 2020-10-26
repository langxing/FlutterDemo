// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_list_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartListResp _$CartListRespFromJson(Map<String, dynamic> json) {
  return CartListResp(
    json['result'] as bool,
    json['code'] as int,
    json['msg'] as String,
    json['data'] == null
        ? null
        : CartListData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CartListRespToJson(CartListResp instance) =>
    <String, dynamic>{
      'result': instance.result,
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

CartListData _$CartListDataFromJson(Map<String, dynamic> json) {
  return CartListData(
    (json['normal'] as List)
        ?.map((e) =>
            e == null ? null : CartItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['abnormal'] as List)
        ?.map((e) =>
            e == null ? null : CartItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CartListDataToJson(CartListData instance) =>
    <String, dynamic>{
      'normal': instance.normal,
      'abnormal': instance.abnormal,
    };

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  return CartItem(
    json['supplier_id'] as String,
    json['sname'] as String,
    json['supplier_img'] as String,
    (json['sku_list'] as List)
        ?.map((e) =>
            e == null ? null : CartSkuItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'supplier_id': instance.supplierId,
      'sname': instance.sname,
      'supplier_img': instance.supplierImg,
      'sku_list': instance.skuList,
    };

CartSkuItem _$CartSkuItemFromJson(Map<String, dynamic> json) {
  return CartSkuItem(
    json['id'] as String,
    json['pid'] as String,
    json['number'] as String,
    json['price'] as String,
    json['jifen'] as String,
    json['vip_price'] as String,
    json['img_id'] as String,
    json['sku_id'] as String,
    json['properties_name'] as String,
    json['stock'] as String,
    json['product_name'] as String,
    json['product_status'] as String,
    json['is_show'] as String,
    json['supplier_id'] as String,
    json['img_url'] as String,
    (json['discount_list'] as List)
        ?.map((e) => e == null
            ? null
            : GoodDiscountCondition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CartSkuItemToJson(CartSkuItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pid': instance.pid,
      'number': instance.number,
      'price': instance.price,
      'jifen': instance.jifen,
      'vip_price': instance.vipPrice,
      'img_id': instance.imgId,
      'sku_id': instance.skuId,
      'properties_name': instance.propertiesName,
      'stock': instance.stock,
      'product_name': instance.productName,
      'product_status': instance.productStatus,
      'is_show': instance.isShow,
      'supplier_id': instance.supplierId,
      'img_url': instance.imgUrl,
      'discount_list': instance.discountList,
    };

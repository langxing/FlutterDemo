// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_product_list_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryProductListResp _$CategoryProductListRespFromJson(
    Map<String, dynamic> json) {
  return CategoryProductListResp(
    json['result'] as bool,
    json['code'] as int,
    json['msg'] as String,
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : CategoryProductCategoryItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CategoryProductListRespToJson(
        CategoryProductListResp instance) =>
    <String, dynamic>{
      'result': instance.result,
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

CategoryProductCategoryItem _$CategoryProductCategoryItemFromJson(
    Map<String, dynamic> json) {
  return CategoryProductCategoryItem(
    json['id'] as String,
    json['name'] as String,
    (json['product_list'] as List)
        ?.map((e) => e == null
            ? null
            : CategoryProductItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )..isChecked = json['isChecked'] as bool;
}

Map<String, dynamic> _$CategoryProductCategoryItemToJson(
        CategoryProductCategoryItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'product_list': instance.productList,
      'isChecked': instance.isChecked,
    };

CategoryProductItem _$CategoryProductItemFromJson(Map<String, dynamic> json) {
  return CategoryProductItem(
    json['id'] as String,
    json['supplier_id'] as String,
    json['product_name'] as String,
    json['market_price'] as String,
    json['cost_price'] as String,
    json['jifen'] as String,
    json['price'] as String,
    json['vip_price'] as String,
    json['shipping_fee'] as String,
    json['commision_rate'] as String,
    json['status'] as String,
    json['check_status'] as String,
    json['cat_id'] as String,
    json['bar_code'] as String,
    json['code_sn'] as String,
    json['sale_type'] as String,
    json['specs'] as String,
    json['img_str'] as String,
    json['img_info_str'] as String,
    json['sale'] as String,
    json['volume'] as String,
    json['visitor'] as String,
    json['sort'] as String,
    json['is_abroad'] as String,
    json['country_id'] as String,
    json['check_value'] as String,
    json['recommand_content'] as String,
    json['createtime'] as String,
    json['updatetime'] as String,
    json['checktime'] as String,
    json['offer_id'] as String,
    json['description'] as String,
    json['is_show'] as String,
    (json['img_list'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$CategoryProductItemToJson(
        CategoryProductItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'supplier_id': instance.supplierId,
      'product_name': instance.productName,
      'market_price': instance.marketPrice,
      'cost_price': instance.costPrice,
      'jifen': instance.jifen,
      'price': instance.price,
      'vip_price': instance.vipPrice,
      'shipping_fee': instance.shippingFee,
      'commision_rate': instance.commisionRate,
      'status': instance.status,
      'check_status': instance.checkStatus,
      'cat_id': instance.catId,
      'bar_code': instance.barCode,
      'code_sn': instance.codeSn,
      'sale_type': instance.saleType,
      'specs': instance.specs,
      'img_str': instance.imgStr,
      'img_info_str': instance.imgInfoStr,
      'sale': instance.sale,
      'volume': instance.volume,
      'visitor': instance.visitor,
      'sort': instance.sort,
      'is_abroad': instance.isAbroad,
      'country_id': instance.countryId,
      'check_value': instance.checkValue,
      'recommand_content': instance.recommandContent,
      'createtime': instance.createtime,
      'updatetime': instance.updatetime,
      'checktime': instance.checktime,
      'offer_id': instance.offerId,
      'description': instance.description,
      'is_show': instance.isShow,
      'img_list': instance.imgList,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_product_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeProductResp _$HomeProductRespFromJson(Map<String, dynamic> json) {
  return HomeProductResp(
    json['result'] as bool,
    json['code'] as int,
    json['msg'] as String,
    json['data'] == null
        ? null
        : HomeProductData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HomeProductRespToJson(HomeProductResp instance) =>
    <String, dynamic>{
      'result': instance.result,
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

HomeProductData _$HomeProductDataFromJson(Map<String, dynamic> json) {
  return HomeProductData(
    (json['list'] as List)
        ?.map((e) => e == null
            ? null
            : HomeProductItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['count'] as String,
  );
}

Map<String, dynamic> _$HomeProductDataToJson(HomeProductData instance) =>
    <String, dynamic>{
      'list': instance.list,
      'count': instance.count,
    };

HomeProductItem _$HomeProductItemFromJson(Map<String, dynamic> json) {
  return HomeProductItem(
    json['tid'] as String,
    json['id'] as String,
    json['product_name'] as String,
    json['market_price'] as String,
    json['price'] as String,
    json['cost_price'] as String,
    json['jifen'] as String,
    json['sale'] as String,
    json['img_str'] as String,
    json['img_info_str'] as String,
    json['recommand_content'] as String,
    json['sort'] as String,
    json['img_url'] as String,
    (json['discount_list'] as List)
        ?.map((e) => e == null
            ? null
            : GoodDiscountCondition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HomeProductItemToJson(HomeProductItem instance) =>
    <String, dynamic>{
      'tid': instance.tid,
      'id': instance.id,
      'product_name': instance.productName,
      'market_price': instance.marketPrice,
      'price': instance.price,
      'cost_price': instance.costPrice,
      'jifen': instance.jifen,
      'sale': instance.sale,
      'img_str': instance.imgStr,
      'img_info_str': instance.imgInfoStr,
      'recommand_content': instance.recommandContent,
      'sort': instance.sort,
      'img_url': instance.imgUrl,
      'discount_list': instance.discountList,
    };

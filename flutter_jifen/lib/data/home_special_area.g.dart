// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_special_area.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeSpecialArea _$HomeSpecialAreaFromJson(Map<String, dynamic> json) {
  return HomeSpecialArea(
    json['result'] as bool,
    json['code'] as int,
    json['msg'] as String,
    json['data'] == null
        ? null
        : SpecialAreaData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HomeSpecialAreaToJson(HomeSpecialArea instance) =>
    <String, dynamic>{
      'result': instance.result,
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

SpecialAreaData _$SpecialAreaDataFromJson(Map<String, dynamic> json) {
  return SpecialAreaData(
    (json['list'] as List)
        ?.map((e) => e == null
            ? null
            : SpecialAreaList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['count'] as String,
  );
}

Map<String, dynamic> _$SpecialAreaDataToJson(SpecialAreaData instance) =>
    <String, dynamic>{
      'list': instance.list,
      'count': instance.count,
    };

SpecialAreaList _$SpecialAreaListFromJson(Map<String, dynamic> json) {
  return SpecialAreaList(
    json['id'] as String,
    json['img_id'] as String,
    json['small_img_id'] as String,
    json['title'] as String,
    json['tag_zone_id'] as String,
    json['jump_type'] as String,
    json['internal_app_pagetype'] as String,
    json['internal_app_pageparams'] == null
        ? null
        : InternalPageparams.fromJson(
            json['internal_app_pageparams'] as Map<String, dynamic>),
    json['h5_url'] as String,
    json['index_show_num'] as String,
    json['small_img_path'] as String,
    (json['product_list'] as List)
        ?.map((e) =>
            e == null ? null : ProductList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['jump_item_id'],
    json['img_url'] as String,
  );
}

Map<String, dynamic> _$SpecialAreaListToJson(SpecialAreaList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'img_id': instance.imgId,
      'small_img_id': instance.smallImgId,
      'title': instance.title,
      'tag_zone_id': instance.tagZoneId,
      'jump_type': instance.jumpType,
      'internal_app_pagetype': instance.internalAppPagetype,
      'internal_app_pageparams': instance.internalAppPageparams,
      'h5_url': instance.h5Url,
      'index_show_num': instance.indexShowNum,
      'small_img_path': instance.smallImgPath,
      'product_list': instance.productList,
      'jump_item_id': instance.jumpItemId,
      'img_url': instance.imgUrl,
    };

InternalPageparams _$InternalPageparamsFromJson(Map<String, dynamic> json) {
  return InternalPageparams(
    json['tag_id'] as String,
    json['product_type'] as String,
    json['interface'] as String,
    json['product_id'] as String,
    json['luckdraw_id'] as String,
    json['scrap_id'] as String,
    json['full_discount_id'] as String,
  );
}

Map<String, dynamic> _$InternalPageparamsToJson(InternalPageparams instance) =>
    <String, dynamic>{
      'tag_id': instance.tagId,
      'product_type': instance.productType,
      'interface': instance.interface,
      'product_id': instance.productId,
      'luckdraw_id': instance.luckdrawId,
      'scrap_id': instance.scrapId,
      'full_discount_id': instance.fullDiscountId,
    };

ProductList _$ProductListFromJson(Map<String, dynamic> json) {
  return ProductList(
    json['tid'] as String,
    json['category_name'] as String,
    json['id'] as String,
    json['supplier_id'] as String,
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
    (json['discount_list'] as List)
        ?.map((e) =>
            e == null ? null : DiscountList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['img_url'] as String,
  );
}

Map<String, dynamic> _$ProductListToJson(ProductList instance) =>
    <String, dynamic>{
      'tid': instance.tid,
      'category_name': instance.categoryName,
      'id': instance.id,
      'supplier_id': instance.supplierId,
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
      'discount_list': instance.discountList,
      'img_url': instance.imgUrl,
    };

DiscountList _$DiscountListFromJson(Map<String, dynamic> json) {
  return DiscountList(
    json['discount_name'] as String,
    (json['discount_content'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$DiscountListToJson(DiscountList instance) =>
    <String, dynamic>{
      'discount_name': instance.discountName,
      'discount_content': instance.discountContent,
    };

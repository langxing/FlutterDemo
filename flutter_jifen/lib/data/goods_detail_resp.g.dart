// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goods_detail_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodsdetailResp _$GoodsdetailRespFromJson(Map<String, dynamic> json) {
  return GoodsdetailResp(
    json['result'] as bool,
    json['code'] as int,
    json['msg'] as String,
    json['data'] == null
        ? null
        : GoodsdetailData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GoodsdetailRespToJson(GoodsdetailResp instance) =>
    <String, dynamic>{
      'result': instance.result,
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

GoodsdetailData _$GoodsdetailDataFromJson(Map<String, dynamic> json) {
  return GoodsdetailData(
    json['product'] == null
        ? null
        : Product.fromJson(json['product'] as Map<String, dynamic>),
    (json['skus'] as List)
        ?.map(
            (e) => e == null ? null : Skus.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['spec_list'] as List)
        ?.map((e) =>
            e == null ? null : GoodsSpec.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['is_collection'] as int,
  );
}

Map<String, dynamic> _$GoodsdetailDataToJson(GoodsdetailData instance) =>
    <String, dynamic>{
      'product': instance.product,
      'skus': instance.skus,
      'spec_list': instance.specList,
      'is_collection': instance.isCollection,
    };

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
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
    json['supplier_name'] as String,
    json['supplier_image_url'] as String,
    (json['img_list'] as List)?.map((e) => e as String)?.toList(),
    (json['img_info_list_app'] as List)
        ?.map((e) => e == null
            ? null
            : ImgInfoListApp.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['img_info_list'] as List)?.map((e) => e as String)?.toList(),
    json['can_buy'] as int,
    json['virtual_sale'] as String,
    (json['discount_list'] as List)
        ?.map((e) => e == null
            ? null
            : GoodDiscountCondition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )..vidoeList = json['video_list'];
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
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
      'supplier_name': instance.supplierName,
      'supplier_image_url': instance.supplierImageUrl,
      'img_list': instance.imgList,
      'video_list': instance.vidoeList,
      'img_info_list_app': instance.imgInfoListApp,
      'img_info_list': instance.imgInfoList,
      'can_buy': instance.canBuy,
      'virtual_sale': instance.virtualSale,
      'discount_list': instance.discountList,
    };

ImgInfoListApp _$ImgInfoListAppFromJson(Map<String, dynamic> json) {
  return ImgInfoListApp(
    json['id'] as String,
    json['img_url'] as String,
    json['width'] as String,
    json['height'] as String,
  );
}

Map<String, dynamic> _$ImgInfoListAppToJson(ImgInfoListApp instance) =>
    <String, dynamic>{
      'id': instance.id,
      'img_url': instance.imgUrl,
      'width': instance.width,
      'height': instance.height,
    };

GoodDiscountCondition _$GoodDiscountConditionFromJson(
    Map<String, dynamic> json) {
  return GoodDiscountCondition(
    json['discount_name'] as String,
    (json['discount_content'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$GoodDiscountConditionToJson(
        GoodDiscountCondition instance) =>
    <String, dynamic>{
      'discount_name': instance.discountName,
      'discount_content': instance.discountContent,
    };

Skus _$SkusFromJson(Map<String, dynamic> json) {
  return Skus(
    json['sku_id'] as String,
    json['properties'] as String,
    json['properties_name'] as String,
    json['pid'] as String,
    json['market_price'] as String,
    json['cost_price'] as String,
    json['jifen'] as String,
    json['price'] as String,
    json['vip_price'] as String,
    json['bar_code'] as String,
    json['img_id'] as String,
    json['stock'] as String,
    json['stock_warning'] as String,
    json['sale'] as String,
    json['volume'] as String,
    json['visitor'] as String,
    json['sort'] as String,
    json['createtime'] as String,
    json['updatetime'] as String,
    json['offer_id'] as String,
    json['ali_sku_id'] as String,
    json['ali_spec_id'] as String,
    json['img_url'] as String,
  );
}

Map<String, dynamic> _$SkusToJson(Skus instance) => <String, dynamic>{
      'sku_id': instance.skuId,
      'properties': instance.properties,
      'properties_name': instance.propertiesName,
      'pid': instance.pid,
      'market_price': instance.marketPrice,
      'cost_price': instance.costPrice,
      'jifen': instance.jifen,
      'price': instance.price,
      'vip_price': instance.vipPrice,
      'bar_code': instance.barCode,
      'img_id': instance.imgId,
      'stock': instance.stock,
      'stock_warning': instance.stockWarning,
      'sale': instance.sale,
      'volume': instance.volume,
      'visitor': instance.visitor,
      'sort': instance.sort,
      'createtime': instance.createtime,
      'updatetime': instance.updatetime,
      'offer_id': instance.offerId,
      'ali_sku_id': instance.aliSkuId,
      'ali_spec_id': instance.aliSpecId,
      'img_url': instance.imgUrl,
    };

GoodsSpec _$GoodsSpecFromJson(Map<String, dynamic> json) {
  return GoodsSpec(
    json['name_id'] as int,
    json['name_text'] as String,
    (json['value_list'] as List)
        ?.map((e) =>
            e == null ? null : SpecValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GoodsSpecToJson(GoodsSpec instance) => <String, dynamic>{
      'name_id': instance.nameId,
      'name_text': instance.nameText,
      'value_list': instance.valueList,
    };

SpecValue _$SpecValueFromJson(Map<String, dynamic> json) {
  return SpecValue(
    json['id'],
    json['value'] as String,
  );
}

Map<String, dynamic> _$SpecValueToJson(SpecValue instance) => <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
    };

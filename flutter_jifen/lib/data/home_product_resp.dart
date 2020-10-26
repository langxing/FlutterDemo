import 'package:json_annotation/json_annotation.dart';

import 'goods_detail_resp.dart';

part 'home_product_resp.g.dart';

@JsonSerializable()
class HomeProductResp extends Object {
  @JsonKey(name: 'result')
  bool result;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  HomeProductData data;

  HomeProductResp(
    this.result,
    this.code,
    this.msg,
    this.data,
  );

  factory HomeProductResp.fromJson(Map<String, dynamic> srcJson) => _$HomeProductRespFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeProductRespToJson(this);
}

@JsonSerializable()
class HomeProductData extends Object {
  @JsonKey(name: 'list')
  List<HomeProductItem> list;

  @JsonKey(name: 'count')
  String count;

  HomeProductData(
    this.list,
    this.count,
  );

  factory HomeProductData.fromJson(Map<String, dynamic> srcJson) => _$HomeProductDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeProductDataToJson(this);
}

@JsonSerializable()
class HomeProductItem extends Object {
  @JsonKey(name: 'tid')
  String tid;

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'product_name')
  String productName;

  @JsonKey(name: 'market_price')
  String marketPrice;

  @JsonKey(name: 'price')
  String price;

  @JsonKey(name: 'cost_price')
  String costPrice;

  @JsonKey(name: 'jifen')
  String jifen;

  @JsonKey(name: 'sale')
  String sale;

  @JsonKey(name: 'img_str')
  String imgStr;

  @JsonKey(name: 'img_info_str')
  String imgInfoStr;

  @JsonKey(name: 'recommand_content')
  String recommandContent;

  @JsonKey(name: 'sort')
  String sort;

  @JsonKey(name: 'img_url')
  String imgUrl;

  @JsonKey(name: 'discount_list')
  List<GoodDiscountCondition> discountList;

  @JsonKey(ignore: true)
  String discountContent;

  HomeProductItem(
    this.tid,
    this.id,
    this.productName,
    this.marketPrice,
    this.price,
    this.costPrice,
    this.jifen,
    this.sale,
    this.imgStr,
    this.imgInfoStr,
    this.recommandContent,
    this.sort,
    this.imgUrl,
    this.discountList,
  );

  factory HomeProductItem.fromJson(Map<String, dynamic> srcJson) => _$HomeProductItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeProductItemToJson(this);
}

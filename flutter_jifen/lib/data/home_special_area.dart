import 'package:json_annotation/json_annotation.dart'; 
  
part 'home_special_area.g.dart';

@JsonSerializable()
  class HomeSpecialArea extends Object {

  @JsonKey(name: 'result')
  bool result;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  SpecialAreaData data;

  HomeSpecialArea(this.result,this.code,this.msg,this.data,);

  factory HomeSpecialArea.fromJson(Map<String, dynamic> srcJson) => _$HomeSpecialAreaFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeSpecialAreaToJson(this);

}

  
@JsonSerializable()
  class SpecialAreaData extends Object {

  @JsonKey(name: 'list')
  List<SpecialAreaList> list;

  @JsonKey(name: 'count')
  String count;

  SpecialAreaData(this.list,this.count,);

  factory SpecialAreaData.fromJson(Map<String, dynamic> srcJson) => _$SpecialAreaDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SpecialAreaDataToJson(this);

}

  
@JsonSerializable()
  class SpecialAreaList extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'img_id')
  String imgId;

  @JsonKey(name: 'small_img_id')
  String smallImgId;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'tag_zone_id')
  String tagZoneId;

  @JsonKey(name: 'jump_type')
  String jumpType;

  @JsonKey(name: 'internal_app_pagetype')
  String internalAppPagetype;

  @JsonKey(name: 'internal_app_pageparams')
  InternalPageparams internalAppPageparams;

  @JsonKey(name: 'h5_url')
  String h5Url;

  @JsonKey(name: 'index_show_num')
  String indexShowNum;

  @JsonKey(name: 'small_img_path')
  String smallImgPath;

  @JsonKey(name: 'product_list')
  List<ProductList> productList;

  @JsonKey(name: 'jump_item_id')
  dynamic jumpItemId;

  @JsonKey(name: 'img_url')
  String imgUrl;

  SpecialAreaList(this.id,this.imgId,this.smallImgId,this.title,this.tagZoneId,this.jumpType,this.internalAppPagetype,this.internalAppPageparams,this.h5Url,this.indexShowNum,this.smallImgPath,this.productList,this.jumpItemId,this.imgUrl,);

  factory SpecialAreaList.fromJson(Map<String, dynamic> srcJson) => _$SpecialAreaListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SpecialAreaListToJson(this);

}

  
@JsonSerializable()
  class InternalPageparams extends Object {

  @JsonKey(name: 'tag_id')
  String tagId;

  @JsonKey(name: 'product_type')
  String productType;

  @JsonKey(name: 'interface')
  String interface;

  @JsonKey(name: 'product_id')
  String productId;

  @JsonKey(name: 'luckdraw_id')
  String luckdrawId;

  @JsonKey(name: 'scrap_id')
  String scrapId;

  @JsonKey(name: 'full_discount_id')
  String fullDiscountId;

  InternalPageparams(this.tagId,this.productType,this.interface,this.productId,this.luckdrawId,this.scrapId,this.fullDiscountId,);

  factory InternalPageparams.fromJson(Map<String, dynamic> srcJson) => _$InternalPageparamsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$InternalPageparamsToJson(this);

}

  
@JsonSerializable()
  class ProductList extends Object {

  @JsonKey(name: 'tid')
  String tid;

  @JsonKey(name: 'category_name')
  String categoryName;

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'supplier_id')
  String supplierId;

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

  @JsonKey(name: 'discount_list')
  List<DiscountList> discountList;

  @JsonKey(name: 'img_url')
  String imgUrl;

  ProductList(this.tid,this.categoryName,this.id,this.supplierId,this.productName,this.marketPrice,this.price,this.costPrice,this.jifen,this.sale,this.imgStr,this.imgInfoStr,this.recommandContent,this.sort,this.discountList,this.imgUrl,);

  factory ProductList.fromJson(Map<String, dynamic> srcJson) => _$ProductListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProductListToJson(this);

}

  
@JsonSerializable()
  class DiscountList extends Object {

  @JsonKey(name: 'discount_name')
  String discountName;

  @JsonKey(name: 'discount_content')
  List<String> discountContent;

  DiscountList(this.discountName,this.discountContent,);

  factory DiscountList.fromJson(Map<String, dynamic> srcJson) => _$DiscountListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DiscountListToJson(this);

}

  

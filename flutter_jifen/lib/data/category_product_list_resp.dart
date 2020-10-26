import 'package:json_annotation/json_annotation.dart';

part 'category_product_list_resp.g.dart';

@JsonSerializable()
class CategoryProductListResp extends Object {
  @JsonKey(name: 'result')
  bool result;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  List<CategoryProductCategoryItem> data;

  CategoryProductListResp(
    this.result,
    this.code,
    this.msg,
    this.data,
  );

  factory CategoryProductListResp.fromJson(Map<String, dynamic> srcJson) =>
      _$CategoryProductListRespFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategoryProductListRespToJson(this);
}

@JsonSerializable()
class CategoryProductCategoryItem extends Object {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'product_list')
  List<CategoryProductItem> productList;

  bool isChecked = false;

  CategoryProductCategoryItem(
    this.id,
    this.name,
    this.productList,
  );

  factory CategoryProductCategoryItem.fromJson(Map<String, dynamic> srcJson) =>
      _$CategoryProductCategoryItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategoryProductCategoryItemToJson(this);
}

@JsonSerializable()
class CategoryProductItem extends Object {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'supplier_id')
  String supplierId;

  @JsonKey(name: 'product_name')
  String productName;

  @JsonKey(name: 'market_price')
  String marketPrice;

  @JsonKey(name: 'cost_price')
  String costPrice;

  @JsonKey(name: 'jifen')
  String jifen;

  @JsonKey(name: 'price')
  String price;

  @JsonKey(name: 'vip_price')
  String vipPrice;

  @JsonKey(name: 'shipping_fee')
  String shippingFee;

  @JsonKey(name: 'commision_rate')
  String commisionRate;

  @JsonKey(name: 'status')
  String status;

  @JsonKey(name: 'check_status')
  String checkStatus;

  @JsonKey(name: 'cat_id')
  String catId;

  @JsonKey(name: 'bar_code')
  String barCode;

  @JsonKey(name: 'code_sn')
  String codeSn;

  @JsonKey(name: 'sale_type')
  String saleType;

  @JsonKey(name: 'specs')
  String specs;

  @JsonKey(name: 'img_str')
  String imgStr;

  @JsonKey(name: 'img_info_str')
  String imgInfoStr;

  @JsonKey(name: 'sale')
  String sale;

  @JsonKey(name: 'volume')
  String volume;

  @JsonKey(name: 'visitor')
  String visitor;

  @JsonKey(name: 'sort')
  String sort;

  @JsonKey(name: 'is_abroad')
  String isAbroad;

  @JsonKey(name: 'country_id')
  String countryId;

  @JsonKey(name: 'check_value')
  String checkValue;

  @JsonKey(name: 'recommand_content')
  String recommandContent;

  @JsonKey(name: 'createtime')
  String createtime;

  @JsonKey(name: 'updatetime')
  String updatetime;

  @JsonKey(name: 'checktime')
  String checktime;

  @JsonKey(name: 'offer_id')
  String offerId;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'is_show')
  String isShow;

  @JsonKey(name: 'img_list')
  List<String> imgList;

  CategoryProductItem(
    this.id,
    this.supplierId,
    this.productName,
    this.marketPrice,
    this.costPrice,
    this.jifen,
    this.price,
    this.vipPrice,
    this.shippingFee,
    this.commisionRate,
    this.status,
    this.checkStatus,
    this.catId,
    this.barCode,
    this.codeSn,
    this.saleType,
    this.specs,
    this.imgStr,
    this.imgInfoStr,
    this.sale,
    this.volume,
    this.visitor,
    this.sort,
    this.isAbroad,
    this.countryId,
    this.checkValue,
    this.recommandContent,
    this.createtime,
    this.updatetime,
    this.checktime,
    this.offerId,
    this.description,
    this.isShow,
    this.imgList,
  );

  factory CategoryProductItem.fromJson(Map<String, dynamic> srcJson) =>
      _$CategoryProductItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategoryProductItemToJson(this);
}

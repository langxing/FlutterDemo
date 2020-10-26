import 'package:json_annotation/json_annotation.dart';

part 'goods_detail_resp.g.dart';

@JsonSerializable()
class GoodsdetailResp extends Object {
  @JsonKey(name: 'result')
  bool result;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  GoodsdetailData data;

  GoodsdetailResp(
    this.result,
    this.code,
    this.msg,
    this.data,
  );

  factory GoodsdetailResp.fromJson(Map<String, dynamic> srcJson) => _$GoodsdetailRespFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GoodsdetailRespToJson(this);
}

@JsonSerializable()
class GoodsdetailData extends Object {
  @JsonKey(name: 'product')
  Product product;

  @JsonKey(name: 'skus')
  List<Skus> skus;

  @JsonKey(name: 'spec_list')
  List<GoodsSpec> specList;

  @JsonKey(name: 'is_collection')
  int isCollection;

  GoodsdetailData(
    this.product,
    this.skus,
    this.specList,
    this.isCollection,
  );

  factory GoodsdetailData.fromJson(Map<String, dynamic> srcJson) => _$GoodsdetailDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GoodsdetailDataToJson(this);
}

@JsonSerializable()
class Product extends Object {
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

  @JsonKey(name: 'supplier_name')
  String supplierName;

  @JsonKey(name: 'supplier_image_url')
  String supplierImageUrl;

  @JsonKey(name: 'img_list')
  List<String> imgList;

  @JsonKey(name: 'video_list')
  dynamic vidoeList;

  @JsonKey(name: 'img_info_list_app')
  List<ImgInfoListApp> imgInfoListApp;

  @JsonKey(name: 'img_info_list')
  List<String> imgInfoList = [];

  @JsonKey(name: 'can_buy')
  int canBuy;

  @JsonKey(name: 'virtual_sale')
  String virtualSale;

  @JsonKey(name: 'discount_list')
  List<GoodDiscountCondition> discountList;

  Product(
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
    this.supplierName,
    this.supplierImageUrl,
    this.imgList,
    this.imgInfoListApp,
    this.imgInfoList,
    this.canBuy,
    this.virtualSale,
    this.discountList,
  );

  factory Product.fromJson(Map<String, dynamic> srcJson) => _$ProductFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class ImgInfoListApp extends Object {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'img_url')
  String imgUrl;

  @JsonKey(name: 'width')
  String width;

  @JsonKey(name: 'height')
  String height;

  ImgInfoListApp(
    this.id,
    this.imgUrl,
    this.width,
    this.height,
  );

  factory ImgInfoListApp.fromJson(Map<String, dynamic> srcJson) => _$ImgInfoListAppFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ImgInfoListAppToJson(this);
}

@JsonSerializable()
class GoodDiscountCondition extends Object {
  @JsonKey(name: 'discount_name')
  String discountName;

  @JsonKey(name: 'discount_content')
  List<String> discountContent;

  GoodDiscountCondition(
    this.discountName,
    this.discountContent,
  );

  static GoodDiscountCondition fromJson(Map<String, dynamic> srcJson) => _$GoodDiscountConditionFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GoodDiscountConditionToJson(this);
}

@JsonSerializable()
class Skus extends Object {
  @JsonKey(name: 'sku_id')
  String skuId;

  @JsonKey(name: 'properties')
  String properties;

  @JsonKey(name: 'properties_name')
  String propertiesName = "";

  @JsonKey(name: 'pid')
  String pid;

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

  @JsonKey(name: 'bar_code')
  String barCode;

  @JsonKey(name: 'img_id')
  String imgId;

  @JsonKey(name: 'stock')
  String stock;

  @JsonKey(name: 'stock_warning')
  String stockWarning;

  @JsonKey(name: 'sale')
  String sale;

  @JsonKey(name: 'volume')
  String volume;

  @JsonKey(name: 'visitor')
  String visitor;

  @JsonKey(name: 'sort')
  String sort;

  @JsonKey(name: 'createtime')
  String createtime;

  @JsonKey(name: 'updatetime')
  String updatetime;

  @JsonKey(name: 'offer_id')
  String offerId;

  @JsonKey(name: 'ali_sku_id')
  String aliSkuId;

  @JsonKey(name: 'ali_spec_id')
  String aliSpecId;

  @JsonKey(name: 'img_url')
  String imgUrl = "";

  Skus(
    this.skuId,
    this.properties,
    this.propertiesName,
    this.pid,
    this.marketPrice,
    this.costPrice,
    this.jifen,
    this.price,
    this.vipPrice,
    this.barCode,
    this.imgId,
    this.stock,
    this.stockWarning,
    this.sale,
    this.volume,
    this.visitor,
    this.sort,
    this.createtime,
    this.updatetime,
    this.offerId,
    this.aliSkuId,
    this.aliSpecId,
    this.imgUrl,
  );

  factory Skus.fromJson(Map<String, dynamic> srcJson) => _$SkusFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SkusToJson(this);
}

@JsonSerializable()
class GoodsSpec extends Object {
  @JsonKey(name: 'name_id')
  int nameId;

  @JsonKey(name: 'name_text')
  String nameText;

  @JsonKey(name: 'value_list')
  List<SpecValue> valueList;

  GoodsSpec(
    this.nameId,
    this.nameText,
    this.valueList,
  );

  factory GoodsSpec.fromJson(Map<String, dynamic> srcJson) => _$GoodsSpecFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GoodsSpecToJson(this);
}

@JsonSerializable()
class SpecValue extends Object {
  @JsonKey(name: 'id')
  dynamic id;

  @JsonKey(name: 'value')
  String value;

  SpecValue(
    this.id,
    this.value,
  );

  factory SpecValue.fromJson(Map<String, dynamic> srcJson) => _$SpecValueFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SpecValueToJson(this);
}

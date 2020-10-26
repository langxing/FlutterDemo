import 'package:json_annotation/json_annotation.dart';

import 'goods_detail_resp.dart';

part 'cart_list_resp.g.dart';

@JsonSerializable()
class CartListResp extends Object {
  @JsonKey(name: 'result')
  bool result;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  CartListData data;

  CartListResp(
    this.result,
    this.code,
    this.msg,
    this.data,
  );

  factory CartListResp.fromJson(Map<String, dynamic> srcJson) => _$CartListRespFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CartListRespToJson(this);
}

@JsonSerializable()
class CartListData extends Object {
  @JsonKey(name: 'normal')
  List<CartItem> normal;

  @JsonKey(name: 'abnormal')
  List<CartItem> abnormal;

  CartListData(
    this.normal,
    this.abnormal,
  );

  factory CartListData.fromJson(Map<String, dynamic> srcJson) => _$CartListDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CartListDataToJson(this);
}

@JsonSerializable()
class CartItem extends Object {
  @JsonKey(name: 'supplier_id')
  String supplierId;

  @JsonKey(name: 'sname')
  String sname;

  @JsonKey(name: 'supplier_img')
  String supplierImg;

  @JsonKey(name: 'sku_list')
  List<CartSkuItem> skuList;

  @JsonKey(ignore: true)
  bool isChecked = false;

  CartItem(
    this.supplierId,
    this.sname,
    this.supplierImg,
    this.skuList,
  );

  factory CartItem.fromJson(Map<String, dynamic> srcJson) => _$CartItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}

@JsonSerializable()
class CartSkuItem extends Object {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'pid')
  String pid;

  @JsonKey(name: 'number')
  String number;

  @JsonKey(name: 'price')
  String price;

  @JsonKey(name: 'jifen')
  String jifen;

  @JsonKey(name: 'vip_price')
  String vipPrice;

  @JsonKey(name: 'img_id')
  String imgId;

  @JsonKey(name: 'sku_id')
  String skuId;

  @JsonKey(name: 'properties_name')
  String propertiesName;

  @JsonKey(name: 'stock')
  String stock;

  @JsonKey(name: 'product_name')
  String productName;

  @JsonKey(name: 'product_status')
  String productStatus;

  @JsonKey(name: 'is_show')
  String isShow;

  @JsonKey(name: 'supplier_id')
  String supplierId;

  @JsonKey(name: 'img_url')
  String imgUrl;

  @JsonKey(ignore: true,)
  bool isChecked = false;

  @JsonKey(name: 'discount_list')
  List<GoodDiscountCondition> discountList;

  CartSkuItem(
    this.id,
    this.pid,
    this.number,
    this.price,
    this.jifen,
    this.vipPrice,
    this.imgId,
    this.skuId,
    this.propertiesName,
    this.stock,
    this.productName,
    this.productStatus,
    this.isShow,
    this.supplierId,
    this.imgUrl,
    this.discountList,
  );

  factory CartSkuItem.fromJson(Map<String, dynamic> srcJson) => _$CartSkuItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CartSkuItemToJson(this);
}

import 'package:flutter_jifen/data/cart_list_resp.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data_check_wrapper.dart';

part 'cart_order_confirm_resp.g.dart';

@JsonSerializable()
class CartOrderConfirmResp extends Object {
  @JsonKey(name: 'result')
  bool result;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  CartOrderConfirmData data;

  CartOrderConfirmResp(
    this.result,
    this.code,
    this.msg,
    this.data,
  );

  factory CartOrderConfirmResp.fromJson(Map<String, dynamic> srcJson) => _$CartOrderConfirmRespFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CartOrderConfirmRespToJson(this);
}

@JsonSerializable()
class CartOrderConfirmData extends Object {
  @JsonKey(name: 'list')
  List<CartOrderConfirmItem> list;

  @JsonKey(name: 'jifen_balance')
  String jifenBalance;

  @JsonKey(name: 'total_price')
  int totalPrice;

  @JsonKey(name: 'total_jifen')
  int totalJifen;

  @JsonKey(name: 'shipping_price')
  String shippingPrice;

  @JsonKey(name: 'pay_price')
  int payPrice;

  CartOrderConfirmData(
    this.list,
    this.jifenBalance,
    this.totalPrice,
    this.totalJifen,
    this.shippingPrice,
    this.payPrice,
  );

  factory CartOrderConfirmData.fromJson(Map<String, dynamic> srcJson) => _$CartOrderConfirmDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CartOrderConfirmDataToJson(this);
}

@JsonSerializable()
class CartOrderConfirmItem extends Object {
  @JsonKey(name: 'supplier_id')
  String supplierId;

  @JsonKey(name: 'supplier_name')
  String supplierName;

  @JsonKey(name: 'supplier_img')
  String supplierImg;

  @JsonKey(name: 'total_price')
  int totalPrice;

  @JsonKey(name: 'total_jifen')
  int totalJifen;

  @JsonKey(name: 'shipping_price')
  int shippingPrice;

  @JsonKey(name: 'pay_price')
  int payPrice;

  @JsonKey(name: 'sku_list')
  List<CartSkuItem> skuCartOrderConfirmItem;

  @JsonKey(name: 'cargo_params')
  dynamic cargoParams;

  @JsonKey(ignore: true)
  String remark;

  @JsonKey(name: 'use_shipping_coupon_id', fromJson: DataCheckWrapper.stringFromDynamic)
  String useShippingCouponId;

  @JsonKey(name: 'use_shipping_coupon_price', fromJson: DataCheckWrapper.intFromDynamic)
  int useShippingCouponPrice;

  @JsonKey(name: 'discount_jifen', fromJson: DataCheckWrapper.stringFromDynamic)
  String discountJiFen;

  @JsonKey(name: 'discount_list')
  List<String> discountList;

  CartOrderConfirmItem(
    this.supplierId,
    this.supplierName,
    this.supplierImg,
    this.totalPrice,
    this.totalJifen,
    this.shippingPrice,
    this.payPrice,
    this.skuCartOrderConfirmItem,
    this.cargoParams,
    this.useShippingCouponId,
    this.useShippingCouponPrice,
    this.discountJiFen,
    this.discountList,
  );

  factory CartOrderConfirmItem.fromJson(Map<String, dynamic> srcJson) => _$CartOrderConfirmItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CartOrderConfirmItemToJson(this);
}

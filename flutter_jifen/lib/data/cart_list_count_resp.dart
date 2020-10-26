import 'package:json_annotation/json_annotation.dart';

part 'cart_list_count_resp.g.dart';

@JsonSerializable()
class CartListCountResp extends Object {
  @JsonKey(name: 'result')
  bool result;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  CartListCountData data;

  CartListCountResp(
    this.result,
    this.code,
    this.msg,
    this.data,
  );

  factory CartListCountResp.fromJson(Map<String, dynamic> srcJson) =>
      _$CartListCountRespFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CartListCountRespToJson(this);
}

@JsonSerializable()
class CartListCountData extends Object {
  @JsonKey(name: 'cart_count')
  String cartCount;

  CartListCountData(
    this.cartCount,
  );

  factory CartListCountData.fromJson(Map<String, dynamic> srcJson) =>
      _$CartListCountDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CartListCountDataToJson(this);
}

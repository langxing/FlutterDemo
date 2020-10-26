import 'package:json_annotation/json_annotation.dart';

part 'mine_order_statistic_count_resp.g.dart';

@JsonSerializable()
class MineOrderStatisticCountResp extends Object {
  @JsonKey(name: 'result')
  bool result;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  MineOrderStatisticData data;

  MineOrderStatisticCountResp(
    this.result,
    this.code,
    this.msg,
    this.data,
  );

  factory MineOrderStatisticCountResp.fromJson(Map<String, dynamic> srcJson) =>
      _$MineOrderStatisticCountRespFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MineOrderStatisticCountRespToJson(this);
}

@JsonSerializable()
class MineOrderStatisticData extends Object {
  @JsonKey(name: 'wait_pay')
  String waitPay;

  @JsonKey(name: 'wait_send')
  String waitSend;

  @JsonKey(name: 'wait_confirm')
  String waitConfirm;

  MineOrderStatisticData(
    this.waitPay,
    this.waitSend,
    this.waitConfirm,
  );

  factory MineOrderStatisticData.fromJson(Map<String, dynamic> srcJson) =>
      _$MineOrderStatisticDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MineOrderStatisticDataToJson(this);
}

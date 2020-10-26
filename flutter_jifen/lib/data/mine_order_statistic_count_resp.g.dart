// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mine_order_statistic_count_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MineOrderStatisticCountResp _$MineOrderStatisticCountRespFromJson(
    Map<String, dynamic> json) {
  return MineOrderStatisticCountResp(
    json['result'] as bool,
    json['code'] as int,
    json['msg'] as String,
    json['data'] == null
        ? null
        : MineOrderStatisticData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MineOrderStatisticCountRespToJson(
        MineOrderStatisticCountResp instance) =>
    <String, dynamic>{
      'result': instance.result,
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

MineOrderStatisticData _$MineOrderStatisticDataFromJson(
    Map<String, dynamic> json) {
  return MineOrderStatisticData(
    json['wait_pay'] as String,
    json['wait_send'] as String,
    json['wait_confirm'] as String,
  );
}

Map<String, dynamic> _$MineOrderStatisticDataToJson(
        MineOrderStatisticData instance) =>
    <String, dynamic>{
      'wait_pay': instance.waitPay,
      'wait_send': instance.waitSend,
      'wait_confirm': instance.waitConfirm,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResp _$BaseRespFromJson(Map<String, dynamic> json) {
  return BaseResp(
    json['result'] as bool,
    json['code'] as int,
    json['msg'] as String,
    json['data'],
  );
}

Map<String, dynamic> _$BaseRespToJson(BaseResp instance) => <String, dynamic>{
      'result': instance.result,
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

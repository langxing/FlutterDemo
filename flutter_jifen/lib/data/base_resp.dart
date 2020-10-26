import 'package:json_annotation/json_annotation.dart'; 
  
part 'base_resp.g.dart';


@JsonSerializable()
  class BaseResp extends Object {

  @JsonKey(name: 'result')
  bool result;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  dynamic data;

  BaseResp(this.result,this.code,this.msg,this.data,);

  factory BaseResp.fromJson(Map<String, dynamic> srcJson) => _$BaseRespFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BaseRespToJson(this);

}
  

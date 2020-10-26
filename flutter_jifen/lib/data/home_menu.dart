import 'package:json_annotation/json_annotation.dart'; 
  
part 'home_menu.g.dart';


@JsonSerializable()
  class HomeMenu extends Object {

  @JsonKey(name: 'result')
  bool result;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  MenuData data;

  HomeMenu(this.result,this.code,this.msg,this.data,);

  factory HomeMenu.fromJson(Map<String, dynamic> srcJson) => _$HomeMenuFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeMenuToJson(this);

}

  
@JsonSerializable()
  class MenuData extends Object {

  @JsonKey(name: 'list')
  List<MenuList> list;

  @JsonKey(name: 'count')
  String count;

  MenuData(this.list,this.count,);

  factory MenuData.fromJson(Map<String, dynamic> srcJson) => _$MenuDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MenuDataToJson(this);

}

  
@JsonSerializable()
  class MenuList extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'img_id')
  String imgId;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'tag_zone_id')
  String tagZoneId;

  @JsonKey(name: 'jump_type')
  String jumpType;

  @JsonKey(name: 'internal_app_pagetype')
  String internalAppPagetype;

  @JsonKey(name: 'internal_app_pageparams')
  InternalAppPageparams internalAppPageparams;

  @JsonKey(name: 'h5_url')
  String h5Url;

  @JsonKey(name: 'img_url')
  String imgUrl;

  MenuList(this.id,this.imgId,this.title,this.tagZoneId,this.jumpType,this.internalAppPagetype,this.internalAppPageparams,this.h5Url,this.imgUrl,);

  factory MenuList.fromJson(Map<String, dynamic> srcJson) => _$MenuListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MenuListToJson(this);

}

  
@JsonSerializable()
  class InternalAppPageparams extends Object {

  @JsonKey(name: 'tag_id')
  String tagId;

  @JsonKey(name: 'product_type')
  String productType;

  @JsonKey(name: 'interface')
  String interface;

  @JsonKey(name: 'product_id')
  String productId;

  InternalAppPageparams(this.tagId,this.productType,this.interface,this.productId,);

  factory InternalAppPageparams.fromJson(Map<String, dynamic> srcJson) => _$InternalAppPageparamsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$InternalAppPageparamsToJson(this);

}

  

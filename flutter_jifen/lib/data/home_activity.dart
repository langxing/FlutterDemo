import 'package:json_annotation/json_annotation.dart'; 
  
part 'home_activity.g.dart';


@JsonSerializable()
  class HomeActivity extends Object {

  @JsonKey(name: 'result')
  bool result;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  ActivityData data;

  HomeActivity(this.result,this.code,this.msg,this.data,);

  factory HomeActivity.fromJson(Map<String, dynamic> srcJson) => _$HomeActivityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeActivityToJson(this);

}

  
@JsonSerializable()
  class ActivityData extends Object {

  @JsonKey(name: 'active')
  List<ActivityActive> active;

  @JsonKey(name: 'news')
  List<dynamic> news;

  ActivityData(this.active,this.news,);

  factory ActivityData.fromJson(Map<String, dynamic> srcJson) => _$ActivityDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ActivityDataToJson(this);

}

  
@JsonSerializable()
  class ActivityActive extends Object {

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
  ActivityInternalPageparams internalAppPageparams;

  @JsonKey(name: 'h5_url')
  String h5Url;

  @JsonKey(name: 'bg_color')
  String bgColor;

  @JsonKey(name: 'index_show_num')
  String indexShowNum;

  @JsonKey(name: 'img_url')
  String imgUrl;

  ActivityActive(this.id,this.imgId,this.title,this.tagZoneId,this.jumpType,this.internalAppPagetype,this.internalAppPageparams,this.h5Url,this.bgColor,this.indexShowNum,this.imgUrl,);

  factory ActivityActive.fromJson(Map<String, dynamic> srcJson) => _$ActivityActiveFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ActivityActiveToJson(this);

}

  
@JsonSerializable()
  class ActivityInternalPageparams extends Object {

  @JsonKey(name: 'tag_id')
  String tagId;

  @JsonKey(name: 'product_type')
  String productType;

  @JsonKey(name: 'interface')
  String interface;

  @JsonKey(name: 'product_id')
  String productId;

  ActivityInternalPageparams(this.tagId,this.productType,this.interface,this.productId,);

  factory ActivityInternalPageparams.fromJson(Map<String, dynamic> srcJson) => _$ActivityInternalPageparamsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ActivityInternalPageparamsToJson(this);

}

  

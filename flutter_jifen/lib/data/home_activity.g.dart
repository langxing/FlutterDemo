// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeActivity _$HomeActivityFromJson(Map<String, dynamic> json) {
  return HomeActivity(
    json['result'] as bool,
    json['code'] as int,
    json['msg'] as String,
    json['data'] == null
        ? null
        : ActivityData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HomeActivityToJson(HomeActivity instance) =>
    <String, dynamic>{
      'result': instance.result,
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

ActivityData _$ActivityDataFromJson(Map<String, dynamic> json) {
  return ActivityData(
    (json['active'] as List)
        ?.map((e) => e == null
            ? null
            : ActivityActive.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['news'] as List,
  );
}

Map<String, dynamic> _$ActivityDataToJson(ActivityData instance) =>
    <String, dynamic>{
      'active': instance.active,
      'news': instance.news,
    };

ActivityActive _$ActivityActiveFromJson(Map<String, dynamic> json) {
  return ActivityActive(
    json['id'] as String,
    json['img_id'] as String,
    json['title'] as String,
    json['tag_zone_id'] as String,
    json['jump_type'] as String,
    json['internal_app_pagetype'] as String,
    json['internal_app_pageparams'] == null
        ? null
        : ActivityInternalPageparams.fromJson(
            json['internal_app_pageparams'] as Map<String, dynamic>),
    json['h5_url'] as String,
    json['bg_color'] as String,
    json['index_show_num'] as String,
    json['img_url'] as String,
  );
}

Map<String, dynamic> _$ActivityActiveToJson(ActivityActive instance) =>
    <String, dynamic>{
      'id': instance.id,
      'img_id': instance.imgId,
      'title': instance.title,
      'tag_zone_id': instance.tagZoneId,
      'jump_type': instance.jumpType,
      'internal_app_pagetype': instance.internalAppPagetype,
      'internal_app_pageparams': instance.internalAppPageparams,
      'h5_url': instance.h5Url,
      'bg_color': instance.bgColor,
      'index_show_num': instance.indexShowNum,
      'img_url': instance.imgUrl,
    };

ActivityInternalPageparams _$ActivityInternalPageparamsFromJson(
    Map<String, dynamic> json) {
  return ActivityInternalPageparams(
    json['tag_id'] as String,
    json['product_type'] as String,
    json['interface'] as String,
    json['product_id'] as String,
  );
}

Map<String, dynamic> _$ActivityInternalPageparamsToJson(
        ActivityInternalPageparams instance) =>
    <String, dynamic>{
      'tag_id': instance.tagId,
      'product_type': instance.productType,
      'interface': instance.interface,
      'product_id': instance.productId,
    };

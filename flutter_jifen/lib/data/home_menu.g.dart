// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeMenu _$HomeMenuFromJson(Map<String, dynamic> json) {
  return HomeMenu(
    json['result'] as bool,
    json['code'] as int,
    json['msg'] as String,
    json['data'] == null
        ? null
        : MenuData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HomeMenuToJson(HomeMenu instance) => <String, dynamic>{
      'result': instance.result,
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

MenuData _$MenuDataFromJson(Map<String, dynamic> json) {
  return MenuData(
    (json['list'] as List)
        ?.map((e) =>
            e == null ? null : MenuList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['count'] as String,
  );
}

Map<String, dynamic> _$MenuDataToJson(MenuData instance) => <String, dynamic>{
      'list': instance.list,
      'count': instance.count,
    };

MenuList _$MenuListFromJson(Map<String, dynamic> json) {
  return MenuList(
    json['id'] as String,
    json['img_id'] as String,
    json['title'] as String,
    json['tag_zone_id'] as String,
    json['jump_type'] as String,
    json['internal_app_pagetype'] as String,
    json['internal_app_pageparams'] == null
        ? null
        : InternalAppPageparams.fromJson(
            json['internal_app_pageparams'] as Map<String, dynamic>),
    json['h5_url'] as String,
    json['img_url'] as String,
  );
}

Map<String, dynamic> _$MenuListToJson(MenuList instance) => <String, dynamic>{
      'id': instance.id,
      'img_id': instance.imgId,
      'title': instance.title,
      'tag_zone_id': instance.tagZoneId,
      'jump_type': instance.jumpType,
      'internal_app_pagetype': instance.internalAppPagetype,
      'internal_app_pageparams': instance.internalAppPageparams,
      'h5_url': instance.h5Url,
      'img_url': instance.imgUrl,
    };

InternalAppPageparams _$InternalAppPageparamsFromJson(
    Map<String, dynamic> json) {
  return InternalAppPageparams(
    json['tag_id'] as String,
    json['product_type'] as String,
    json['interface'] as String,
    json['product_id'] as String,
  );
}

Map<String, dynamic> _$InternalAppPageparamsToJson(
        InternalAppPageparams instance) =>
    <String, dynamic>{
      'tag_id': instance.tagId,
      'product_type': instance.productType,
      'interface': instance.interface,
      'product_id': instance.productId,
    };

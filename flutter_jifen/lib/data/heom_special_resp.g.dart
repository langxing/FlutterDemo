// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'heom_special_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeSpecialResp _$HomeSpecialRespFromJson(Map<String, dynamic> json) {
  return HomeSpecialResp(
    json['result'] as bool,
    json['code'] as int,
    json['msg'] as String,
    json['data'] == null
        ? null
        : HomeSpecialData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HomeSpecialRespToJson(HomeSpecialResp instance) =>
    <String, dynamic>{
      'result': instance.result,
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

HomeSpecialData _$HomeSpecialDataFromJson(Map<String, dynamic> json) {
  return HomeSpecialData(
    (json['category_list'] as List)
        ?.map((e) => e == null
            ? null
            : HomeSpecialCategoryItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['tag_info'] == null
        ? null
        : HomeSpecialTagItem.fromJson(json['tag_info'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HomeSpecialDataToJson(HomeSpecialData instance) =>
    <String, dynamic>{
      'category_list': instance.categoryList,
      'tag_info': instance.tagInfo,
    };

HomeSpecialCategoryItem _$HomeSpecialCategoryItemFromJson(
    Map<String, dynamic> json) {
  return HomeSpecialCategoryItem(
    json['id'] as String,
    json['name'] as String,
    json['img_id'] as String,
    json['app_img_id'] as String,
    json['unit_id'] as String,
    json['sort'] as String,
    json['desc'] as String,
    json['status'] as String,
    json['fid'] as String,
    json['specs'] as String,
    json['is_index'] as String,
    json['createtime'] as String,
    json['updatetime'] as String,
  );
}

Map<String, dynamic> _$HomeSpecialCategoryItemToJson(
        HomeSpecialCategoryItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'img_id': instance.imgId,
      'app_img_id': instance.appImgId,
      'unit_id': instance.unitId,
      'sort': instance.sort,
      'desc': instance.desc,
      'status': instance.status,
      'fid': instance.fid,
      'specs': instance.specs,
      'is_index': instance.isIndex,
      'createtime': instance.createtime,
      'updatetime': instance.updatetime,
    };

HomeSpecialTagItem _$HomeSpecialTagItemFromJson(Map<String, dynamic> json) {
  return HomeSpecialTagItem(
    json['name'] as String,
    json['id'] as String,
  );
}

Map<String, dynamic> _$HomeSpecialTagItemToJson(HomeSpecialTagItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };

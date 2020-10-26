// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_list_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryListResp _$CategoryListRespFromJson(Map<String, dynamic> json) {
  return CategoryListResp(
    json['result'] as bool,
    json['code'] as int,
    json['msg'] as String,
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : CategoryItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CategoryListRespToJson(CategoryListResp instance) =>
    <String, dynamic>{
      'result': instance.result,
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

CategoryItem _$CategoryItemFromJson(Map<String, dynamic> json) {
  return CategoryItem(
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
  )..isChecked = json['isChecked'] as bool;
}

Map<String, dynamic> _$CategoryItemToJson(CategoryItem instance) =>
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
      'isChecked': instance.isChecked,
    };

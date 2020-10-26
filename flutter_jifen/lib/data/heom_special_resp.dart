import 'package:json_annotation/json_annotation.dart';

part 'heom_special_resp.g.dart';

@JsonSerializable()
class HomeSpecialResp extends Object {
  @JsonKey(name: 'result')
  bool result;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  HomeSpecialData data;

  HomeSpecialResp(
    this.result,
    this.code,
    this.msg,
    this.data,
  );

  factory HomeSpecialResp.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeSpecialRespFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeSpecialRespToJson(this);
}

@JsonSerializable()
class HomeSpecialData extends Object {
  @JsonKey(name: 'category_list')
  List<HomeSpecialCategoryItem> categoryList;

  @JsonKey(name: 'tag_info')
  HomeSpecialTagItem tagInfo;

  HomeSpecialData(
    this.categoryList,
    this.tagInfo,
  );

  factory HomeSpecialData.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeSpecialDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeSpecialDataToJson(this);
}

@JsonSerializable()
class HomeSpecialCategoryItem extends Object {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'img_id')
  String imgId;

  @JsonKey(name: 'app_img_id')
  String appImgId;

  @JsonKey(name: 'unit_id')
  String unitId;

  @JsonKey(name: 'sort')
  String sort;

  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'status')
  String status;

  @JsonKey(name: 'fid')
  String fid;

  @JsonKey(name: 'specs')
  String specs;

  @JsonKey(name: 'is_index')
  String isIndex;

  @JsonKey(name: 'createtime')
  String createtime;

  @JsonKey(name: 'updatetime')
  String updatetime;

  HomeSpecialCategoryItem(
    this.id,
    this.name,
    this.imgId,
    this.appImgId,
    this.unitId,
    this.sort,
    this.desc,
    this.status,
    this.fid,
    this.specs,
    this.isIndex,
    this.createtime,
    this.updatetime,
  );

  factory HomeSpecialCategoryItem.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeSpecialCategoryItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeSpecialCategoryItemToJson(this);
}

@JsonSerializable()
class HomeSpecialTagItem extends Object {
  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'id')
  String id;

  HomeSpecialTagItem(
    this.name,
    this.id,
  );

  factory HomeSpecialTagItem.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeSpecialTagItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeSpecialTagItemToJson(this);
}

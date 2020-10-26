
import 'package:json_annotation/json_annotation.dart';

part 'category_list_resp.g.dart';

@JsonSerializable()
class CategoryListResp extends Object {
  @JsonKey(name: 'result')
  bool result;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  List<CategoryItem> data;

  CategoryListResp(
    this.result,
    this.code,
    this.msg,
    this.data,
  );

  factory CategoryListResp.fromJson(Map<String, dynamic> srcJson) =>
      _$CategoryListRespFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategoryListRespToJson(this);
}

@JsonSerializable()
class CategoryItem extends Object {
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

  bool isChecked = false;

  CategoryItem(
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

  factory CategoryItem.fromJson(Map<String, dynamic> srcJson) =>
      _$CategoryItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategoryItemToJson(this);
}

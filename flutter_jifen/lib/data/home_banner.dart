import 'package:json_annotation/json_annotation.dart'; 
  
part 'home_banner.g.dart';

@JsonSerializable()
  class HomeBanner extends Object {

  @JsonKey(name: 'result')
  bool result;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  BannerData data;

  HomeBanner(this.result,this.code,this.msg,this.data,);

  factory HomeBanner.fromJson(Map<String, dynamic> srcJson) => _$HomeBannerFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeBannerToJson(this);

}

  
@JsonSerializable()
  class BannerData extends Object {

  @JsonKey(name: 'bannerList')
  List<BannerList> bannerList;

  BannerData(this.bannerList,);

  factory BannerData.fromJson(Map<String, dynamic> srcJson) => _$BannerDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BannerDataToJson(this);

}

  
@JsonSerializable()
  class BannerList extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'product_id')
  String productId;

  @JsonKey(name: 'img_id')
  String imgId;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'bg_color')
  String bgColor;

  @JsonKey(name: 'img_url')
  String imgUrl;

  BannerList(this.id,this.productId,this.imgId,this.url,this.bgColor,this.imgUrl,);

  factory BannerList.fromJson(Map<String, dynamic> srcJson) => _$BannerListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BannerListToJson(this);

}

  

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeBanner _$HomeBannerFromJson(Map<String, dynamic> json) {
  return HomeBanner(
    json['result'] as bool,
    json['code'] as int,
    json['msg'] as String,
    json['data'] == null
        ? null
        : BannerData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HomeBannerToJson(HomeBanner instance) =>
    <String, dynamic>{
      'result': instance.result,
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

BannerData _$BannerDataFromJson(Map<String, dynamic> json) {
  return BannerData(
    (json['bannerList'] as List)
        ?.map((e) =>
            e == null ? null : BannerList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BannerDataToJson(BannerData instance) =>
    <String, dynamic>{
      'bannerList': instance.bannerList,
    };

BannerList _$BannerListFromJson(Map<String, dynamic> json) {
  return BannerList(
    json['id'] as String,
    json['product_id'] as String,
    json['img_id'] as String,
    json['url'] as String,
    json['bg_color'] as String,
    json['img_url'] as String,
  );
}

Map<String, dynamic> _$BannerListToJson(BannerList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'img_id': instance.imgId,
      'url': instance.url,
      'bg_color': instance.bgColor,
      'img_url': instance.imgUrl,
    };

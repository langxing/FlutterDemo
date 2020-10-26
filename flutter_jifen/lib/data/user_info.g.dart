// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return UserInfo(
    json['result'] as bool,
    json['code'] as int,
    json['msg'] as String,
    json['data'] == null
        ? null
        : UserData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'result': instance.result,
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return UserData(
    json['user_id'] as String,
    json['open_id'] as String,
    json['zfb_open_id'] as String,
    json['union_id'] as String,
    json['mobile'] as String,
    json['account_num'] as String,
    json['nick_name'] as String,
    json['zfb_nick_name'] as String,
    json['avatar_url'] as String,
    json['zfb_avatar_url'] as String,
    json['gender'] as String,
    json['city'] as String,
    json['province'] as String,
    json['user_type'] as String,
    json['user_status'] as String,
    json['is_certified'] as String,
    json['is_student_certified'] as String,
    json['create_time'] as String,
    json['alert_coupon'] as String,
    json['alert_vip'] as String,
    json['is_del'] as String,
    json['source'] as String,
    json['plat'] as String,
    json['jifen_total'] as String,
    json['jifen_balance'] as String,
    json['jifen_used'] as String,
    json['today_jifen'] as String,
  );
}

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'user_id': instance.userId,
      'open_id': instance.openId,
      'zfb_open_id': instance.zfbOpenId,
      'union_id': instance.unionId,
      'mobile': instance.mobile,
      'account_num': instance.accountNum,
      'nick_name': instance.nickName,
      'zfb_nick_name': instance.zfbNickName,
      'avatar_url': instance.avatarUrl,
      'zfb_avatar_url': instance.zfbAvatarUrl,
      'gender': instance.gender,
      'city': instance.city,
      'province': instance.province,
      'user_type': instance.userType,
      'user_status': instance.userStatus,
      'is_certified': instance.isCertified,
      'is_student_certified': instance.isStudentCertified,
      'create_time': instance.createTime,
      'alert_coupon': instance.alertCoupon,
      'alert_vip': instance.alertVip,
      'is_del': instance.isDel,
      'source': instance.source,
      'plat': instance.plat,
      'jifen_total': instance.jifenTotal,
      'jifen_balance': instance.jifenBalance,
      'jifen_used': instance.jifenUsed,
      'today_jifen': instance.todayJifen,
    };

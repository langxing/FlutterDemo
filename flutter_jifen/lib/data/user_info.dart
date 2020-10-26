import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable()
class UserInfo extends Object {

  @JsonKey(name: 'result')
  bool result;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  UserData data;

  UserInfo(this.result,this.code,this.msg,this.data,);

  factory UserInfo.fromJson(Map<String, dynamic> srcJson) => _$UserInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);

}


@JsonSerializable()
class UserData extends Object {

  @JsonKey(name: 'user_id')
  String userId;

  @JsonKey(name: 'open_id')
  String openId;

  @JsonKey(name: 'zfb_open_id')
  String zfbOpenId;

  @JsonKey(name: 'union_id')
  String unionId;

  @JsonKey(name: 'mobile')
  String mobile;

  @JsonKey(name: 'account_num')
  String accountNum;

  @JsonKey(name: 'nick_name')
  String nickName;

  @JsonKey(name: 'zfb_nick_name')
  String zfbNickName;

  @JsonKey(name: 'avatar_url')
  String avatarUrl;

  @JsonKey(name: 'zfb_avatar_url')
  String zfbAvatarUrl;

  @JsonKey(name: 'gender')
  String gender;

  @JsonKey(name: 'city')
  String city;

  @JsonKey(name: 'province')
  String province;

  @JsonKey(name: 'user_type')
  String userType;

  @JsonKey(name: 'user_status')
  String userStatus;

  @JsonKey(name: 'is_certified')
  String isCertified;

  @JsonKey(name: 'is_student_certified')
  String isStudentCertified;

  @JsonKey(name: 'create_time')
  String createTime;

  @JsonKey(name: 'alert_coupon')
  String alertCoupon;

  @JsonKey(name: 'alert_vip')
  String alertVip;

  @JsonKey(name: 'is_del')
  String isDel;

  @JsonKey(name: 'source')
  String source;

  @JsonKey(name: 'plat')
  String plat;

  @JsonKey(name: 'jifen_total')
  String jifenTotal;

  @JsonKey(name: 'jifen_balance')
  String jifenBalance;

  @JsonKey(name: 'jifen_used')
  String jifenUsed;

  @JsonKey(name: 'today_jifen')
  String todayJifen;

  UserData(this.userId,this.openId,this.zfbOpenId,this.unionId,this.mobile,this.accountNum,this.nickName,this.zfbNickName,this.avatarUrl,this.zfbAvatarUrl,this.gender,this.city,this.province,this.userType,this.userStatus,this.isCertified,this.isStudentCertified,this.createTime,this.alertCoupon,this.alertVip,this.isDel,this.source,this.plat,this.jifenTotal,this.jifenBalance,this.jifenUsed,this.todayJifen,);

  factory UserData.fromJson(Map<String, dynamic> srcJson) => _$UserDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);

}



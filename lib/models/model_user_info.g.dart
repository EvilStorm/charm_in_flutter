// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserInfoModel _$$_UserInfoModelFromJson(Map<String, dynamic> json) =>
    _$_UserInfoModel(
      id: json['_id'] as String?,
      gender: json['gender'] as int?,
      nickName: json['nickName'] as String?,
      comment: json['comment'] as String?,
      image_url: json['image_url'] as String?,
      pushToken: json['pushToken'] as String?,
    );

Map<String, dynamic> _$$_UserInfoModelToJson(_$_UserInfoModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'gender': instance.gender,
      'nickName': instance.nickName,
      'comment': instance.comment,
      'image_url': instance.image_url,
      'pushToken': instance.pushToken,
    };

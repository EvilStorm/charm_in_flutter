// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      firebaseId: json['firebaseId'] as String,
      joinType: json['joinType'] as int,
      secureLevel: json['secureLevel'] as int,
      setting: SettingModel.fromJson(json['setting'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'firebaseId': instance.firebaseId,
      'joinType': instance.joinType,
      'secureLevel': instance.secureLevel,
      'setting': instance.setting,
    };

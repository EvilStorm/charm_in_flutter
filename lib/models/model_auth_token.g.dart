// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_auth_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthTokenModel _$$_AuthTokenModelFromJson(Map<String, dynamic> json) =>
    _$_AuthTokenModel(
      type: json['type'] as String,
      token: json['token'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$$_AuthTokenModelToJson(_$_AuthTokenModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'token': instance.token,
      'refreshToken': instance.refreshToken,
    };

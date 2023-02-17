// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_app_version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppVersionModel _$$_AppVersionModelFromJson(Map<String, dynamic> json) =>
    _$_AppVersionModel(
      id: json['_id'] as String,
      appVerCode: json['appVerCode'] as int,
      appVerName: json['appVerName'] as String,
      say: json['say'] as String,
      os: json['os'] as String,
      isMustUpdate: json['isMustUpdate'] as bool,
    );

Map<String, dynamic> _$$_AppVersionModelToJson(_$_AppVersionModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'appVerCode': instance.appVerCode,
      'appVerName': instance.appVerName,
      'say': instance.say,
      'os': instance.os,
      'isMustUpdate': instance.isMustUpdate,
    };

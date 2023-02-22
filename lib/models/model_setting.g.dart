// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SettingModel _$$_SettingModelFromJson(Map<String, dynamic> json) =>
    _$_SettingModel(
      id: json['_id'] as String?,
      answerAlarml: json['answerAlarml'] as bool,
      systemAlarm: json['systemAlarm'] as bool,
      eventAlarm: json['eventAlarm'] as bool,
      nightEventAlarm: json['nightEventAlarm'] as bool,
      emailSend: json['emailSend'] as bool,
    );

Map<String, dynamic> _$$_SettingModelToJson(_$_SettingModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'answerAlarml': instance.answerAlarml,
      'systemAlarm': instance.systemAlarm,
      'eventAlarm': instance.eventAlarm,
      'nightEventAlarm': instance.nightEventAlarm,
      'emailSend': instance.emailSend,
    };

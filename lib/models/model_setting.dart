import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_setting.freezed.dart';
part 'model_setting.g.dart';

@freezed
class SettingModel with _$SettingModel {
  const factory SettingModel({
    @JsonKey(name: '_id') String? id,
    required bool answerAlarm,
    required bool systemAlarm,
    required bool eventAlarm,
    required bool nightEventAlarm,
    required bool emailSend,
  }) = _SettingModel;

  factory SettingModel.fromJson(Map<String, dynamic> json) =>
      _$SettingModelFromJson(json);
}

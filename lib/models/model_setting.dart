import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_setting.freezed.dart';
part 'model_setting.g.dart';

@freezed
class SettingModel with _$SettingModel {
  const factory SettingModel({
    @JsonKey(name: '_id') String? id,
    required bool answerAlarml,
    required bool systemAlarm,
    required bool eventAlarm,
    required bool nightEventAlarm,
    required bool emailSend,
  }) = _SettingModel;

  factory SettingModel.fromJson(Map<String, dynamic> json) =>
      _$SettingModelFromJson(json);
}


// // @freezed
// // class AppVersionModel with _$AppVersionModel {
// //   const factory AppVersionModel({
// //     @JsonKey(name: '_id') String? id,
// //     required int appVerCode,
// //     required String appVerName,
// //     required String say,
// //     required String os,
// //     required bool isMustUpdate,
// //   }) = _AppVersionModel;

// //   factory AppVersionModel.fromJson(Map<String, dynamic> json) =>
// //       _$AppVersionModelFromJson(json);
// // }




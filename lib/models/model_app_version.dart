import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_app_version.freezed.dart';
part 'model_app_version.g.dart';

@freezed
class AppVersionModel with _$AppVersionModel {
  const factory AppVersionModel({
    @JsonKey(name: '_id') String? id,
    required int appVerCode,
    required String appVerName,
    required String say,
    required String os,
    required bool isMustUpdate,
  }) = _AppVersionModel;

  factory AppVersionModel.fromJson(Map<String, dynamic> json) =>
      _$AppVersionModelFromJson(json);
}

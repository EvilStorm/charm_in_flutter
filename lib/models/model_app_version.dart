import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_app_version.freezed.dart';
part 'model_app_version.g.dart';

@freezed
class AppVersionModel with _$AppVersionModel {
  //   "_id": "63edebb7a3bf827c20cfbe9b",
  // "appVerCode": 1,
  // "appVerName": "0.0.1",
  // "say": "개발 시작되었습니다.",
  // "os": "A",
  // "isMustUpdate": false
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

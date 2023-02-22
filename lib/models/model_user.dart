import 'package:charmin/models/model_setting.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_user.freezed.dart';
part 'model_user.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String firebaseId,
    required int joinType,
    required int secureLevel,
    required SettingModel setting,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

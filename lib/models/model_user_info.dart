import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_user_info.freezed.dart';
part 'model_user_info.g.dart';

@freezed
class UserInfoModel with _$UserInfoModel {
  const factory UserInfoModel({
    @JsonKey(name: '_id') String? id,
    int? gender,
    String? nickName,
    String? comment,
    String? image_url,
    String? pushToken,
  }) = _UserInfoModel;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);
}

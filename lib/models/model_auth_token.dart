import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_auth_token.freezed.dart';
part 'model_auth_token.g.dart';

///
/// serialized command: flutter packages pub run build_runner build
@freezed
class AuthTokenModel with _$AuthTokenModel {
  const factory AuthTokenModel({
    required String? type,
    required String token,
    required String refreshToken,
  }) = _AuthTokenModel;

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenModelFromJson(json);
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model_auth_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthTokenModel _$AuthTokenModelFromJson(Map<String, dynamic> json) {
  return _AuthTokenModel.fromJson(json);
}

/// @nodoc
mixin _$AuthTokenModel {
  String? get type => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthTokenModelCopyWith<AuthTokenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthTokenModelCopyWith<$Res> {
  factory $AuthTokenModelCopyWith(
          AuthTokenModel value, $Res Function(AuthTokenModel) then) =
      _$AuthTokenModelCopyWithImpl<$Res, AuthTokenModel>;
  @useResult
  $Res call({String? type, String token, String refreshToken});
}

/// @nodoc
class _$AuthTokenModelCopyWithImpl<$Res, $Val extends AuthTokenModel>
    implements $AuthTokenModelCopyWith<$Res> {
  _$AuthTokenModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? token = null,
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthTokenModelCopyWith<$Res>
    implements $AuthTokenModelCopyWith<$Res> {
  factory _$$_AuthTokenModelCopyWith(
          _$_AuthTokenModel value, $Res Function(_$_AuthTokenModel) then) =
      __$$_AuthTokenModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? type, String token, String refreshToken});
}

/// @nodoc
class __$$_AuthTokenModelCopyWithImpl<$Res>
    extends _$AuthTokenModelCopyWithImpl<$Res, _$_AuthTokenModel>
    implements _$$_AuthTokenModelCopyWith<$Res> {
  __$$_AuthTokenModelCopyWithImpl(
      _$_AuthTokenModel _value, $Res Function(_$_AuthTokenModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? token = null,
    Object? refreshToken = null,
  }) {
    return _then(_$_AuthTokenModel(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthTokenModel implements _AuthTokenModel {
  const _$_AuthTokenModel(
      {required this.type, required this.token, required this.refreshToken});

  factory _$_AuthTokenModel.fromJson(Map<String, dynamic> json) =>
      _$$_AuthTokenModelFromJson(json);

  @override
  final String? type;
  @override
  final String token;
  @override
  final String refreshToken;

  @override
  String toString() {
    return 'AuthTokenModel(type: $type, token: $token, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthTokenModel &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, token, refreshToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthTokenModelCopyWith<_$_AuthTokenModel> get copyWith =>
      __$$_AuthTokenModelCopyWithImpl<_$_AuthTokenModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthTokenModelToJson(
      this,
    );
  }
}

abstract class _AuthTokenModel implements AuthTokenModel {
  const factory _AuthTokenModel(
      {required final String? type,
      required final String token,
      required final String refreshToken}) = _$_AuthTokenModel;

  factory _AuthTokenModel.fromJson(Map<String, dynamic> json) =
      _$_AuthTokenModel.fromJson;

  @override
  String? get type;
  @override
  String get token;
  @override
  String get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$_AuthTokenModelCopyWith<_$_AuthTokenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

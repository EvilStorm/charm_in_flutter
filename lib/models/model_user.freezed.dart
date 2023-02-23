// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get firebaseId => throw _privateConstructorUsedError;
  int get joinType => throw _privateConstructorUsedError;
  int get secureLevel => throw _privateConstructorUsedError;
  SettingModel get setting => throw _privateConstructorUsedError;
  UserInfoModel get extendInfo => throw _privateConstructorUsedError;
  AuthTokenModel get authToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String firebaseId,
      int joinType,
      int secureLevel,
      SettingModel setting,
      UserInfoModel extendInfo,
      AuthTokenModel authToken});

  $SettingModelCopyWith<$Res> get setting;
  $UserInfoModelCopyWith<$Res> get extendInfo;
  $AuthTokenModelCopyWith<$Res> get authToken;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firebaseId = null,
    Object? joinType = null,
    Object? secureLevel = null,
    Object? setting = null,
    Object? extendInfo = null,
    Object? authToken = null,
  }) {
    return _then(_value.copyWith(
      firebaseId: null == firebaseId
          ? _value.firebaseId
          : firebaseId // ignore: cast_nullable_to_non_nullable
              as String,
      joinType: null == joinType
          ? _value.joinType
          : joinType // ignore: cast_nullable_to_non_nullable
              as int,
      secureLevel: null == secureLevel
          ? _value.secureLevel
          : secureLevel // ignore: cast_nullable_to_non_nullable
              as int,
      setting: null == setting
          ? _value.setting
          : setting // ignore: cast_nullable_to_non_nullable
              as SettingModel,
      extendInfo: null == extendInfo
          ? _value.extendInfo
          : extendInfo // ignore: cast_nullable_to_non_nullable
              as UserInfoModel,
      authToken: null == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as AuthTokenModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SettingModelCopyWith<$Res> get setting {
    return $SettingModelCopyWith<$Res>(_value.setting, (value) {
      return _then(_value.copyWith(setting: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserInfoModelCopyWith<$Res> get extendInfo {
    return $UserInfoModelCopyWith<$Res>(_value.extendInfo, (value) {
      return _then(_value.copyWith(extendInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthTokenModelCopyWith<$Res> get authToken {
    return $AuthTokenModelCopyWith<$Res>(_value.authToken, (value) {
      return _then(_value.copyWith(authToken: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firebaseId,
      int joinType,
      int secureLevel,
      SettingModel setting,
      UserInfoModel extendInfo,
      AuthTokenModel authToken});

  @override
  $SettingModelCopyWith<$Res> get setting;
  @override
  $UserInfoModelCopyWith<$Res> get extendInfo;
  @override
  $AuthTokenModelCopyWith<$Res> get authToken;
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firebaseId = null,
    Object? joinType = null,
    Object? secureLevel = null,
    Object? setting = null,
    Object? extendInfo = null,
    Object? authToken = null,
  }) {
    return _then(_$_UserModel(
      firebaseId: null == firebaseId
          ? _value.firebaseId
          : firebaseId // ignore: cast_nullable_to_non_nullable
              as String,
      joinType: null == joinType
          ? _value.joinType
          : joinType // ignore: cast_nullable_to_non_nullable
              as int,
      secureLevel: null == secureLevel
          ? _value.secureLevel
          : secureLevel // ignore: cast_nullable_to_non_nullable
              as int,
      setting: null == setting
          ? _value.setting
          : setting // ignore: cast_nullable_to_non_nullable
              as SettingModel,
      extendInfo: null == extendInfo
          ? _value.extendInfo
          : extendInfo // ignore: cast_nullable_to_non_nullable
              as UserInfoModel,
      authToken: null == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as AuthTokenModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModel implements _UserModel {
  const _$_UserModel(
      {required this.firebaseId,
      required this.joinType,
      required this.secureLevel,
      required this.setting,
      required this.extendInfo,
      required this.authToken});

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  final String firebaseId;
  @override
  final int joinType;
  @override
  final int secureLevel;
  @override
  final SettingModel setting;
  @override
  final UserInfoModel extendInfo;
  @override
  final AuthTokenModel authToken;

  @override
  String toString() {
    return 'UserModel(firebaseId: $firebaseId, joinType: $joinType, secureLevel: $secureLevel, setting: $setting, extendInfo: $extendInfo, authToken: $authToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            (identical(other.firebaseId, firebaseId) ||
                other.firebaseId == firebaseId) &&
            (identical(other.joinType, joinType) ||
                other.joinType == joinType) &&
            (identical(other.secureLevel, secureLevel) ||
                other.secureLevel == secureLevel) &&
            (identical(other.setting, setting) || other.setting == setting) &&
            (identical(other.extendInfo, extendInfo) ||
                other.extendInfo == extendInfo) &&
            (identical(other.authToken, authToken) ||
                other.authToken == authToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, firebaseId, joinType,
      secureLevel, setting, extendInfo, authToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {required final String firebaseId,
      required final int joinType,
      required final int secureLevel,
      required final SettingModel setting,
      required final UserInfoModel extendInfo,
      required final AuthTokenModel authToken}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  String get firebaseId;
  @override
  int get joinType;
  @override
  int get secureLevel;
  @override
  SettingModel get setting;
  @override
  UserInfoModel get extendInfo;
  @override
  AuthTokenModel get authToken;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

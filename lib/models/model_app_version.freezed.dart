// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model_app_version.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppVersionModel _$AppVersionModelFromJson(Map<String, dynamic> json) {
  return _AppVersionModel.fromJson(json);
}

/// @nodoc
mixin _$AppVersionModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  int get appVerCode => throw _privateConstructorUsedError;
  String get appVerName => throw _privateConstructorUsedError;
  String get say => throw _privateConstructorUsedError;
  String get os => throw _privateConstructorUsedError;
  bool get isMustUpdate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppVersionModelCopyWith<AppVersionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppVersionModelCopyWith<$Res> {
  factory $AppVersionModelCopyWith(
          AppVersionModel value, $Res Function(AppVersionModel) then) =
      _$AppVersionModelCopyWithImpl<$Res, AppVersionModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      int appVerCode,
      String appVerName,
      String say,
      String os,
      bool isMustUpdate});
}

/// @nodoc
class _$AppVersionModelCopyWithImpl<$Res, $Val extends AppVersionModel>
    implements $AppVersionModelCopyWith<$Res> {
  _$AppVersionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? appVerCode = null,
    Object? appVerName = null,
    Object? say = null,
    Object? os = null,
    Object? isMustUpdate = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      appVerCode: null == appVerCode
          ? _value.appVerCode
          : appVerCode // ignore: cast_nullable_to_non_nullable
              as int,
      appVerName: null == appVerName
          ? _value.appVerName
          : appVerName // ignore: cast_nullable_to_non_nullable
              as String,
      say: null == say
          ? _value.say
          : say // ignore: cast_nullable_to_non_nullable
              as String,
      os: null == os
          ? _value.os
          : os // ignore: cast_nullable_to_non_nullable
              as String,
      isMustUpdate: null == isMustUpdate
          ? _value.isMustUpdate
          : isMustUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppVersionModelCopyWith<$Res>
    implements $AppVersionModelCopyWith<$Res> {
  factory _$$_AppVersionModelCopyWith(
          _$_AppVersionModel value, $Res Function(_$_AppVersionModel) then) =
      __$$_AppVersionModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      int appVerCode,
      String appVerName,
      String say,
      String os,
      bool isMustUpdate});
}

/// @nodoc
class __$$_AppVersionModelCopyWithImpl<$Res>
    extends _$AppVersionModelCopyWithImpl<$Res, _$_AppVersionModel>
    implements _$$_AppVersionModelCopyWith<$Res> {
  __$$_AppVersionModelCopyWithImpl(
      _$_AppVersionModel _value, $Res Function(_$_AppVersionModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? appVerCode = null,
    Object? appVerName = null,
    Object? say = null,
    Object? os = null,
    Object? isMustUpdate = null,
  }) {
    return _then(_$_AppVersionModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      appVerCode: null == appVerCode
          ? _value.appVerCode
          : appVerCode // ignore: cast_nullable_to_non_nullable
              as int,
      appVerName: null == appVerName
          ? _value.appVerName
          : appVerName // ignore: cast_nullable_to_non_nullable
              as String,
      say: null == say
          ? _value.say
          : say // ignore: cast_nullable_to_non_nullable
              as String,
      os: null == os
          ? _value.os
          : os // ignore: cast_nullable_to_non_nullable
              as String,
      isMustUpdate: null == isMustUpdate
          ? _value.isMustUpdate
          : isMustUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppVersionModel implements _AppVersionModel {
  const _$_AppVersionModel(
      {@JsonKey(name: '_id') this.id,
      required this.appVerCode,
      required this.appVerName,
      required this.say,
      required this.os,
      required this.isMustUpdate});

  factory _$_AppVersionModel.fromJson(Map<String, dynamic> json) =>
      _$$_AppVersionModelFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final int appVerCode;
  @override
  final String appVerName;
  @override
  final String say;
  @override
  final String os;
  @override
  final bool isMustUpdate;

  @override
  String toString() {
    return 'AppVersionModel(id: $id, appVerCode: $appVerCode, appVerName: $appVerName, say: $say, os: $os, isMustUpdate: $isMustUpdate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppVersionModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.appVerCode, appVerCode) ||
                other.appVerCode == appVerCode) &&
            (identical(other.appVerName, appVerName) ||
                other.appVerName == appVerName) &&
            (identical(other.say, say) || other.say == say) &&
            (identical(other.os, os) || other.os == os) &&
            (identical(other.isMustUpdate, isMustUpdate) ||
                other.isMustUpdate == isMustUpdate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, appVerCode, appVerName, say, os, isMustUpdate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppVersionModelCopyWith<_$_AppVersionModel> get copyWith =>
      __$$_AppVersionModelCopyWithImpl<_$_AppVersionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppVersionModelToJson(
      this,
    );
  }
}

abstract class _AppVersionModel implements AppVersionModel {
  const factory _AppVersionModel(
      {@JsonKey(name: '_id') final String? id,
      required final int appVerCode,
      required final String appVerName,
      required final String say,
      required final String os,
      required final bool isMustUpdate}) = _$_AppVersionModel;

  factory _AppVersionModel.fromJson(Map<String, dynamic> json) =
      _$_AppVersionModel.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  int get appVerCode;
  @override
  String get appVerName;
  @override
  String get say;
  @override
  String get os;
  @override
  bool get isMustUpdate;
  @override
  @JsonKey(ignore: true)
  _$$_AppVersionModelCopyWith<_$_AppVersionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

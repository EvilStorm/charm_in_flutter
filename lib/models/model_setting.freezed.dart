// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model_setting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SettingModel _$SettingModelFromJson(Map<String, dynamic> json) {
  return _SettingModel.fromJson(json);
}

/// @nodoc
mixin _$SettingModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  bool get answerAlarml => throw _privateConstructorUsedError;
  bool get systemAlarm => throw _privateConstructorUsedError;
  bool get eventAlarm => throw _privateConstructorUsedError;
  bool get nightEventAlarm => throw _privateConstructorUsedError;
  bool get emailSend => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingModelCopyWith<SettingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingModelCopyWith<$Res> {
  factory $SettingModelCopyWith(
          SettingModel value, $Res Function(SettingModel) then) =
      _$SettingModelCopyWithImpl<$Res, SettingModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      bool answerAlarml,
      bool systemAlarm,
      bool eventAlarm,
      bool nightEventAlarm,
      bool emailSend});
}

/// @nodoc
class _$SettingModelCopyWithImpl<$Res, $Val extends SettingModel>
    implements $SettingModelCopyWith<$Res> {
  _$SettingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? answerAlarml = null,
    Object? systemAlarm = null,
    Object? eventAlarm = null,
    Object? nightEventAlarm = null,
    Object? emailSend = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      answerAlarml: null == answerAlarml
          ? _value.answerAlarml
          : answerAlarml // ignore: cast_nullable_to_non_nullable
              as bool,
      systemAlarm: null == systemAlarm
          ? _value.systemAlarm
          : systemAlarm // ignore: cast_nullable_to_non_nullable
              as bool,
      eventAlarm: null == eventAlarm
          ? _value.eventAlarm
          : eventAlarm // ignore: cast_nullable_to_non_nullable
              as bool,
      nightEventAlarm: null == nightEventAlarm
          ? _value.nightEventAlarm
          : nightEventAlarm // ignore: cast_nullable_to_non_nullable
              as bool,
      emailSend: null == emailSend
          ? _value.emailSend
          : emailSend // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SettingModelCopyWith<$Res>
    implements $SettingModelCopyWith<$Res> {
  factory _$$_SettingModelCopyWith(
          _$_SettingModel value, $Res Function(_$_SettingModel) then) =
      __$$_SettingModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      bool answerAlarml,
      bool systemAlarm,
      bool eventAlarm,
      bool nightEventAlarm,
      bool emailSend});
}

/// @nodoc
class __$$_SettingModelCopyWithImpl<$Res>
    extends _$SettingModelCopyWithImpl<$Res, _$_SettingModel>
    implements _$$_SettingModelCopyWith<$Res> {
  __$$_SettingModelCopyWithImpl(
      _$_SettingModel _value, $Res Function(_$_SettingModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? answerAlarml = null,
    Object? systemAlarm = null,
    Object? eventAlarm = null,
    Object? nightEventAlarm = null,
    Object? emailSend = null,
  }) {
    return _then(_$_SettingModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      answerAlarml: null == answerAlarml
          ? _value.answerAlarml
          : answerAlarml // ignore: cast_nullable_to_non_nullable
              as bool,
      systemAlarm: null == systemAlarm
          ? _value.systemAlarm
          : systemAlarm // ignore: cast_nullable_to_non_nullable
              as bool,
      eventAlarm: null == eventAlarm
          ? _value.eventAlarm
          : eventAlarm // ignore: cast_nullable_to_non_nullable
              as bool,
      nightEventAlarm: null == nightEventAlarm
          ? _value.nightEventAlarm
          : nightEventAlarm // ignore: cast_nullable_to_non_nullable
              as bool,
      emailSend: null == emailSend
          ? _value.emailSend
          : emailSend // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SettingModel implements _SettingModel {
  const _$_SettingModel(
      {@JsonKey(name: '_id') this.id,
      required this.answerAlarml,
      required this.systemAlarm,
      required this.eventAlarm,
      required this.nightEventAlarm,
      required this.emailSend});

  factory _$_SettingModel.fromJson(Map<String, dynamic> json) =>
      _$$_SettingModelFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final bool answerAlarml;
  @override
  final bool systemAlarm;
  @override
  final bool eventAlarm;
  @override
  final bool nightEventAlarm;
  @override
  final bool emailSend;

  @override
  String toString() {
    return 'SettingModel(id: $id, answerAlarml: $answerAlarml, systemAlarm: $systemAlarm, eventAlarm: $eventAlarm, nightEventAlarm: $nightEventAlarm, emailSend: $emailSend)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.answerAlarml, answerAlarml) ||
                other.answerAlarml == answerAlarml) &&
            (identical(other.systemAlarm, systemAlarm) ||
                other.systemAlarm == systemAlarm) &&
            (identical(other.eventAlarm, eventAlarm) ||
                other.eventAlarm == eventAlarm) &&
            (identical(other.nightEventAlarm, nightEventAlarm) ||
                other.nightEventAlarm == nightEventAlarm) &&
            (identical(other.emailSend, emailSend) ||
                other.emailSend == emailSend));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, answerAlarml, systemAlarm,
      eventAlarm, nightEventAlarm, emailSend);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingModelCopyWith<_$_SettingModel> get copyWith =>
      __$$_SettingModelCopyWithImpl<_$_SettingModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SettingModelToJson(
      this,
    );
  }
}

abstract class _SettingModel implements SettingModel {
  const factory _SettingModel(
      {@JsonKey(name: '_id') final String? id,
      required final bool answerAlarml,
      required final bool systemAlarm,
      required final bool eventAlarm,
      required final bool nightEventAlarm,
      required final bool emailSend}) = _$_SettingModel;

  factory _SettingModel.fromJson(Map<String, dynamic> json) =
      _$_SettingModel.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  bool get answerAlarml;
  @override
  bool get systemAlarm;
  @override
  bool get eventAlarm;
  @override
  bool get nightEventAlarm;
  @override
  bool get emailSend;
  @override
  @JsonKey(ignore: true)
  _$$_SettingModelCopyWith<_$_SettingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

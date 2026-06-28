// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'language_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Language _$LanguageFromJson(Map<String, dynamic> json) {
  return _Language.fromJson(json);
}

/// @nodoc
mixin _$Language {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get flag => throw _privateConstructorUsedError;
  String get nativeName => throw _privateConstructorUsedError;

  /// Serializes this Language to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Language
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LanguageCopyWith<Language> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguageCopyWith<$Res> {
  factory $LanguageCopyWith(Language value, $Res Function(Language) then) =
      _$LanguageCopyWithImpl<$Res, Language>;
  @useResult
  $Res call({String code, String name, String flag, String nativeName});
}

/// @nodoc
class _$LanguageCopyWithImpl<$Res, $Val extends Language>
    implements $LanguageCopyWith<$Res> {
  _$LanguageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Language
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? flag = null,
    Object? nativeName = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      flag: null == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String,
      nativeName: null == nativeName
          ? _value.nativeName
          : nativeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LanguageImplCopyWith<$Res>
    implements $LanguageCopyWith<$Res> {
  factory _$$LanguageImplCopyWith(
          _$LanguageImpl value, $Res Function(_$LanguageImpl) then) =
      __$$LanguageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String name, String flag, String nativeName});
}

/// @nodoc
class __$$LanguageImplCopyWithImpl<$Res>
    extends _$LanguageCopyWithImpl<$Res, _$LanguageImpl>
    implements _$$LanguageImplCopyWith<$Res> {
  __$$LanguageImplCopyWithImpl(
      _$LanguageImpl _value, $Res Function(_$LanguageImpl) _then)
      : super(_value, _then);

  /// Create a copy of Language
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? flag = null,
    Object? nativeName = null,
  }) {
    return _then(_$LanguageImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      flag: null == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String,
      nativeName: null == nativeName
          ? _value.nativeName
          : nativeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LanguageImpl implements _Language {
  const _$LanguageImpl(
      {required this.code,
      required this.name,
      required this.flag,
      required this.nativeName});

  factory _$LanguageImpl.fromJson(Map<String, dynamic> json) =>
      _$$LanguageImplFromJson(json);

  @override
  final String code;
  @override
  final String name;
  @override
  final String flag;
  @override
  final String nativeName;

  @override
  String toString() {
    return 'Language(code: $code, name: $name, flag: $flag, nativeName: $nativeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LanguageImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.flag, flag) || other.flag == flag) &&
            (identical(other.nativeName, nativeName) ||
                other.nativeName == nativeName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, name, flag, nativeName);

  /// Create a copy of Language
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LanguageImplCopyWith<_$LanguageImpl> get copyWith =>
      __$$LanguageImplCopyWithImpl<_$LanguageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LanguageImplToJson(
      this,
    );
  }
}

abstract class _Language implements Language {
  const factory _Language(
      {required final String code,
      required final String name,
      required final String flag,
      required final String nativeName}) = _$LanguageImpl;

  factory _Language.fromJson(Map<String, dynamic> json) =
      _$LanguageImpl.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  String get flag;
  @override
  String get nativeName;

  /// Create a copy of Language
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LanguageImplCopyWith<_$LanguageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProficiencyLevel _$ProficiencyLevelFromJson(Map<String, dynamic> json) {
  return _ProficiencyLevel.fromJson(json);
}

/// @nodoc
mixin _$ProficiencyLevel {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get numericLevel => throw _privateConstructorUsedError;

  /// Serializes this ProficiencyLevel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProficiencyLevel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProficiencyLevelCopyWith<ProficiencyLevel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProficiencyLevelCopyWith<$Res> {
  factory $ProficiencyLevelCopyWith(
          ProficiencyLevel value, $Res Function(ProficiencyLevel) then) =
      _$ProficiencyLevelCopyWithImpl<$Res, ProficiencyLevel>;
  @useResult
  $Res call({String code, String name, String description, int numericLevel});
}

/// @nodoc
class _$ProficiencyLevelCopyWithImpl<$Res, $Val extends ProficiencyLevel>
    implements $ProficiencyLevelCopyWith<$Res> {
  _$ProficiencyLevelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProficiencyLevel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? description = null,
    Object? numericLevel = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      numericLevel: null == numericLevel
          ? _value.numericLevel
          : numericLevel // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProficiencyLevelImplCopyWith<$Res>
    implements $ProficiencyLevelCopyWith<$Res> {
  factory _$$ProficiencyLevelImplCopyWith(_$ProficiencyLevelImpl value,
          $Res Function(_$ProficiencyLevelImpl) then) =
      __$$ProficiencyLevelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String name, String description, int numericLevel});
}

/// @nodoc
class __$$ProficiencyLevelImplCopyWithImpl<$Res>
    extends _$ProficiencyLevelCopyWithImpl<$Res, _$ProficiencyLevelImpl>
    implements _$$ProficiencyLevelImplCopyWith<$Res> {
  __$$ProficiencyLevelImplCopyWithImpl(_$ProficiencyLevelImpl _value,
      $Res Function(_$ProficiencyLevelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProficiencyLevel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? description = null,
    Object? numericLevel = null,
  }) {
    return _then(_$ProficiencyLevelImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      numericLevel: null == numericLevel
          ? _value.numericLevel
          : numericLevel // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProficiencyLevelImpl implements _ProficiencyLevel {
  const _$ProficiencyLevelImpl(
      {required this.code,
      required this.name,
      required this.description,
      required this.numericLevel});

  factory _$ProficiencyLevelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProficiencyLevelImplFromJson(json);

  @override
  final String code;
  @override
  final String name;
  @override
  final String description;
  @override
  final int numericLevel;

  @override
  String toString() {
    return 'ProficiencyLevel(code: $code, name: $name, description: $description, numericLevel: $numericLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProficiencyLevelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.numericLevel, numericLevel) ||
                other.numericLevel == numericLevel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, name, description, numericLevel);

  /// Create a copy of ProficiencyLevel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProficiencyLevelImplCopyWith<_$ProficiencyLevelImpl> get copyWith =>
      __$$ProficiencyLevelImplCopyWithImpl<_$ProficiencyLevelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProficiencyLevelImplToJson(
      this,
    );
  }
}

abstract class _ProficiencyLevel implements ProficiencyLevel {
  const factory _ProficiencyLevel(
      {required final String code,
      required final String name,
      required final String description,
      required final int numericLevel}) = _$ProficiencyLevelImpl;

  factory _ProficiencyLevel.fromJson(Map<String, dynamic> json) =
      _$ProficiencyLevelImpl.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  String get description;
  @override
  int get numericLevel;

  /// Create a copy of ProficiencyLevel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProficiencyLevelImplCopyWith<_$ProficiencyLevelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

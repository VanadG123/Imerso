// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vocabulary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SavedWord {
  VocabWord get word => throw _privateConstructorUsedError;
  DateTime get savedAt => throw _privateConstructorUsedError;
  String get sourceLanguage => throw _privateConstructorUsedError;
  int get reviewCount => throw _privateConstructorUsedError;
  bool get isMastered => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;

  /// Create a copy of SavedWord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SavedWordCopyWith<SavedWord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedWordCopyWith<$Res> {
  factory $SavedWordCopyWith(SavedWord value, $Res Function(SavedWord) then) =
      _$SavedWordCopyWithImpl<$Res, SavedWord>;
  @useResult
  $Res call(
      {VocabWord word,
      DateTime savedAt,
      String sourceLanguage,
      int reviewCount,
      bool isMastered,
      List<String> tags});

  $VocabWordCopyWith<$Res> get word;
}

/// @nodoc
class _$SavedWordCopyWithImpl<$Res, $Val extends SavedWord>
    implements $SavedWordCopyWith<$Res> {
  _$SavedWordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SavedWord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? savedAt = null,
    Object? sourceLanguage = null,
    Object? reviewCount = null,
    Object? isMastered = null,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as VocabWord,
      savedAt: null == savedAt
          ? _value.savedAt
          : savedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sourceLanguage: null == sourceLanguage
          ? _value.sourceLanguage
          : sourceLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      isMastered: null == isMastered
          ? _value.isMastered
          : isMastered // ignore: cast_nullable_to_non_nullable
              as bool,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  /// Create a copy of SavedWord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VocabWordCopyWith<$Res> get word {
    return $VocabWordCopyWith<$Res>(_value.word, (value) {
      return _then(_value.copyWith(word: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SavedWordImplCopyWith<$Res>
    implements $SavedWordCopyWith<$Res> {
  factory _$$SavedWordImplCopyWith(
          _$SavedWordImpl value, $Res Function(_$SavedWordImpl) then) =
      __$$SavedWordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {VocabWord word,
      DateTime savedAt,
      String sourceLanguage,
      int reviewCount,
      bool isMastered,
      List<String> tags});

  @override
  $VocabWordCopyWith<$Res> get word;
}

/// @nodoc
class __$$SavedWordImplCopyWithImpl<$Res>
    extends _$SavedWordCopyWithImpl<$Res, _$SavedWordImpl>
    implements _$$SavedWordImplCopyWith<$Res> {
  __$$SavedWordImplCopyWithImpl(
      _$SavedWordImpl _value, $Res Function(_$SavedWordImpl) _then)
      : super(_value, _then);

  /// Create a copy of SavedWord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? savedAt = null,
    Object? sourceLanguage = null,
    Object? reviewCount = null,
    Object? isMastered = null,
    Object? tags = null,
  }) {
    return _then(_$SavedWordImpl(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as VocabWord,
      savedAt: null == savedAt
          ? _value.savedAt
          : savedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sourceLanguage: null == sourceLanguage
          ? _value.sourceLanguage
          : sourceLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      isMastered: null == isMastered
          ? _value.isMastered
          : isMastered // ignore: cast_nullable_to_non_nullable
              as bool,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$SavedWordImpl implements _SavedWord {
  const _$SavedWordImpl(
      {required this.word,
      required this.savedAt,
      required this.sourceLanguage,
      this.reviewCount = 0,
      this.isMastered = false,
      final List<String> tags = const []})
      : _tags = tags;

  @override
  final VocabWord word;
  @override
  final DateTime savedAt;
  @override
  final String sourceLanguage;
  @override
  @JsonKey()
  final int reviewCount;
  @override
  @JsonKey()
  final bool isMastered;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'SavedWord(word: $word, savedAt: $savedAt, sourceLanguage: $sourceLanguage, reviewCount: $reviewCount, isMastered: $isMastered, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedWordImpl &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.savedAt, savedAt) || other.savedAt == savedAt) &&
            (identical(other.sourceLanguage, sourceLanguage) ||
                other.sourceLanguage == sourceLanguage) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.isMastered, isMastered) ||
                other.isMastered == isMastered) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @override
  int get hashCode => Object.hash(runtimeType, word, savedAt, sourceLanguage,
      reviewCount, isMastered, const DeepCollectionEquality().hash(_tags));

  /// Create a copy of SavedWord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedWordImplCopyWith<_$SavedWordImpl> get copyWith =>
      __$$SavedWordImplCopyWithImpl<_$SavedWordImpl>(this, _$identity);
}

abstract class _SavedWord implements SavedWord {
  const factory _SavedWord(
      {required final VocabWord word,
      required final DateTime savedAt,
      required final String sourceLanguage,
      final int reviewCount,
      final bool isMastered,
      final List<String> tags}) = _$SavedWordImpl;

  @override
  VocabWord get word;
  @override
  DateTime get savedAt;
  @override
  String get sourceLanguage;
  @override
  int get reviewCount;
  @override
  bool get isMastered;
  @override
  List<String> get tags;

  /// Create a copy of SavedWord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SavedWordImplCopyWith<_$SavedWordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

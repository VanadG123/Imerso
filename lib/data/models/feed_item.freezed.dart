// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubtitleSegment _$SubtitleSegmentFromJson(Map<String, dynamic> json) {
  return _SubtitleSegment.fromJson(json);
}

/// @nodoc
mixin _$SubtitleSegment {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get translationText => throw _privateConstructorUsedError;
  double get startSeconds => throw _privateConstructorUsedError;
  List<String> get highlightedWordIds => throw _privateConstructorUsedError;

  /// Serializes this SubtitleSegment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubtitleSegment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubtitleSegmentCopyWith<SubtitleSegment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubtitleSegmentCopyWith<$Res> {
  factory $SubtitleSegmentCopyWith(
          SubtitleSegment value, $Res Function(SubtitleSegment) then) =
      _$SubtitleSegmentCopyWithImpl<$Res, SubtitleSegment>;
  @useResult
  $Res call(
      {String id,
      String text,
      String translationText,
      double startSeconds,
      List<String> highlightedWordIds});
}

/// @nodoc
class _$SubtitleSegmentCopyWithImpl<$Res, $Val extends SubtitleSegment>
    implements $SubtitleSegmentCopyWith<$Res> {
  _$SubtitleSegmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubtitleSegment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? translationText = null,
    Object? startSeconds = null,
    Object? highlightedWordIds = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      translationText: null == translationText
          ? _value.translationText
          : translationText // ignore: cast_nullable_to_non_nullable
              as String,
      startSeconds: null == startSeconds
          ? _value.startSeconds
          : startSeconds // ignore: cast_nullable_to_non_nullable
              as double,
      highlightedWordIds: null == highlightedWordIds
          ? _value.highlightedWordIds
          : highlightedWordIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubtitleSegmentImplCopyWith<$Res>
    implements $SubtitleSegmentCopyWith<$Res> {
  factory _$$SubtitleSegmentImplCopyWith(_$SubtitleSegmentImpl value,
          $Res Function(_$SubtitleSegmentImpl) then) =
      __$$SubtitleSegmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String text,
      String translationText,
      double startSeconds,
      List<String> highlightedWordIds});
}

/// @nodoc
class __$$SubtitleSegmentImplCopyWithImpl<$Res>
    extends _$SubtitleSegmentCopyWithImpl<$Res, _$SubtitleSegmentImpl>
    implements _$$SubtitleSegmentImplCopyWith<$Res> {
  __$$SubtitleSegmentImplCopyWithImpl(
      _$SubtitleSegmentImpl _value, $Res Function(_$SubtitleSegmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubtitleSegment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? translationText = null,
    Object? startSeconds = null,
    Object? highlightedWordIds = null,
  }) {
    return _then(_$SubtitleSegmentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      translationText: null == translationText
          ? _value.translationText
          : translationText // ignore: cast_nullable_to_non_nullable
              as String,
      startSeconds: null == startSeconds
          ? _value.startSeconds
          : startSeconds // ignore: cast_nullable_to_non_nullable
              as double,
      highlightedWordIds: null == highlightedWordIds
          ? _value._highlightedWordIds
          : highlightedWordIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubtitleSegmentImpl implements _SubtitleSegment {
  const _$SubtitleSegmentImpl(
      {required this.id,
      required this.text,
      required this.translationText,
      required this.startSeconds,
      final List<String> highlightedWordIds = const []})
      : _highlightedWordIds = highlightedWordIds;

  factory _$SubtitleSegmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubtitleSegmentImplFromJson(json);

  @override
  final String id;
  @override
  final String text;
  @override
  final String translationText;
  @override
  final double startSeconds;
  final List<String> _highlightedWordIds;
  @override
  @JsonKey()
  List<String> get highlightedWordIds {
    if (_highlightedWordIds is EqualUnmodifiableListView)
      return _highlightedWordIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_highlightedWordIds);
  }

  @override
  String toString() {
    return 'SubtitleSegment(id: $id, text: $text, translationText: $translationText, startSeconds: $startSeconds, highlightedWordIds: $highlightedWordIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubtitleSegmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.translationText, translationText) ||
                other.translationText == translationText) &&
            (identical(other.startSeconds, startSeconds) ||
                other.startSeconds == startSeconds) &&
            const DeepCollectionEquality()
                .equals(other._highlightedWordIds, _highlightedWordIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, text, translationText,
      startSeconds, const DeepCollectionEquality().hash(_highlightedWordIds));

  /// Create a copy of SubtitleSegment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubtitleSegmentImplCopyWith<_$SubtitleSegmentImpl> get copyWith =>
      __$$SubtitleSegmentImplCopyWithImpl<_$SubtitleSegmentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubtitleSegmentImplToJson(
      this,
    );
  }
}

abstract class _SubtitleSegment implements SubtitleSegment {
  const factory _SubtitleSegment(
      {required final String id,
      required final String text,
      required final String translationText,
      required final double startSeconds,
      final List<String> highlightedWordIds}) = _$SubtitleSegmentImpl;

  factory _SubtitleSegment.fromJson(Map<String, dynamic> json) =
      _$SubtitleSegmentImpl.fromJson;

  @override
  String get id;
  @override
  String get text;
  @override
  String get translationText;
  @override
  double get startSeconds;
  @override
  List<String> get highlightedWordIds;

  /// Create a copy of SubtitleSegment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubtitleSegmentImplCopyWith<_$SubtitleSegmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VocabWord _$VocabWordFromJson(Map<String, dynamic> json) {
  return _VocabWord.fromJson(json);
}

/// @nodoc
mixin _$VocabWord {
  String get id => throw _privateConstructorUsedError;
  String get word => throw _privateConstructorUsedError;
  String get reading => throw _privateConstructorUsedError;
  String get meaning => throw _privateConstructorUsedError;
  String get partOfSpeech => throw _privateConstructorUsedError;
  String get exampleSentence => throw _privateConstructorUsedError;
  String get difficultyLevel => throw _privateConstructorUsedError;
  bool get isSaved => throw _privateConstructorUsedError;

  /// Serializes this VocabWord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VocabWord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VocabWordCopyWith<VocabWord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VocabWordCopyWith<$Res> {
  factory $VocabWordCopyWith(VocabWord value, $Res Function(VocabWord) then) =
      _$VocabWordCopyWithImpl<$Res, VocabWord>;
  @useResult
  $Res call(
      {String id,
      String word,
      String reading,
      String meaning,
      String partOfSpeech,
      String exampleSentence,
      String difficultyLevel,
      bool isSaved});
}

/// @nodoc
class _$VocabWordCopyWithImpl<$Res, $Val extends VocabWord>
    implements $VocabWordCopyWith<$Res> {
  _$VocabWordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VocabWord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? word = null,
    Object? reading = null,
    Object? meaning = null,
    Object? partOfSpeech = null,
    Object? exampleSentence = null,
    Object? difficultyLevel = null,
    Object? isSaved = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      reading: null == reading
          ? _value.reading
          : reading // ignore: cast_nullable_to_non_nullable
              as String,
      meaning: null == meaning
          ? _value.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String,
      partOfSpeech: null == partOfSpeech
          ? _value.partOfSpeech
          : partOfSpeech // ignore: cast_nullable_to_non_nullable
              as String,
      exampleSentence: null == exampleSentence
          ? _value.exampleSentence
          : exampleSentence // ignore: cast_nullable_to_non_nullable
              as String,
      difficultyLevel: null == difficultyLevel
          ? _value.difficultyLevel
          : difficultyLevel // ignore: cast_nullable_to_non_nullable
              as String,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VocabWordImplCopyWith<$Res>
    implements $VocabWordCopyWith<$Res> {
  factory _$$VocabWordImplCopyWith(
          _$VocabWordImpl value, $Res Function(_$VocabWordImpl) then) =
      __$$VocabWordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String word,
      String reading,
      String meaning,
      String partOfSpeech,
      String exampleSentence,
      String difficultyLevel,
      bool isSaved});
}

/// @nodoc
class __$$VocabWordImplCopyWithImpl<$Res>
    extends _$VocabWordCopyWithImpl<$Res, _$VocabWordImpl>
    implements _$$VocabWordImplCopyWith<$Res> {
  __$$VocabWordImplCopyWithImpl(
      _$VocabWordImpl _value, $Res Function(_$VocabWordImpl) _then)
      : super(_value, _then);

  /// Create a copy of VocabWord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? word = null,
    Object? reading = null,
    Object? meaning = null,
    Object? partOfSpeech = null,
    Object? exampleSentence = null,
    Object? difficultyLevel = null,
    Object? isSaved = null,
  }) {
    return _then(_$VocabWordImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      reading: null == reading
          ? _value.reading
          : reading // ignore: cast_nullable_to_non_nullable
              as String,
      meaning: null == meaning
          ? _value.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String,
      partOfSpeech: null == partOfSpeech
          ? _value.partOfSpeech
          : partOfSpeech // ignore: cast_nullable_to_non_nullable
              as String,
      exampleSentence: null == exampleSentence
          ? _value.exampleSentence
          : exampleSentence // ignore: cast_nullable_to_non_nullable
              as String,
      difficultyLevel: null == difficultyLevel
          ? _value.difficultyLevel
          : difficultyLevel // ignore: cast_nullable_to_non_nullable
              as String,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VocabWordImpl implements _VocabWord {
  const _$VocabWordImpl(
      {required this.id,
      required this.word,
      required this.reading,
      required this.meaning,
      required this.partOfSpeech,
      required this.exampleSentence,
      required this.difficultyLevel,
      this.isSaved = false});

  factory _$VocabWordImpl.fromJson(Map<String, dynamic> json) =>
      _$$VocabWordImplFromJson(json);

  @override
  final String id;
  @override
  final String word;
  @override
  final String reading;
  @override
  final String meaning;
  @override
  final String partOfSpeech;
  @override
  final String exampleSentence;
  @override
  final String difficultyLevel;
  @override
  @JsonKey()
  final bool isSaved;

  @override
  String toString() {
    return 'VocabWord(id: $id, word: $word, reading: $reading, meaning: $meaning, partOfSpeech: $partOfSpeech, exampleSentence: $exampleSentence, difficultyLevel: $difficultyLevel, isSaved: $isSaved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VocabWordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.reading, reading) || other.reading == reading) &&
            (identical(other.meaning, meaning) || other.meaning == meaning) &&
            (identical(other.partOfSpeech, partOfSpeech) ||
                other.partOfSpeech == partOfSpeech) &&
            (identical(other.exampleSentence, exampleSentence) ||
                other.exampleSentence == exampleSentence) &&
            (identical(other.difficultyLevel, difficultyLevel) ||
                other.difficultyLevel == difficultyLevel) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, word, reading, meaning,
      partOfSpeech, exampleSentence, difficultyLevel, isSaved);

  /// Create a copy of VocabWord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VocabWordImplCopyWith<_$VocabWordImpl> get copyWith =>
      __$$VocabWordImplCopyWithImpl<_$VocabWordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VocabWordImplToJson(
      this,
    );
  }
}

abstract class _VocabWord implements VocabWord {
  const factory _VocabWord(
      {required final String id,
      required final String word,
      required final String reading,
      required final String meaning,
      required final String partOfSpeech,
      required final String exampleSentence,
      required final String difficultyLevel,
      final bool isSaved}) = _$VocabWordImpl;

  factory _VocabWord.fromJson(Map<String, dynamic> json) =
      _$VocabWordImpl.fromJson;

  @override
  String get id;
  @override
  String get word;
  @override
  String get reading;
  @override
  String get meaning;
  @override
  String get partOfSpeech;
  @override
  String get exampleSentence;
  @override
  String get difficultyLevel;
  @override
  bool get isSaved;

  /// Create a copy of VocabWord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VocabWordImplCopyWith<_$VocabWordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FeedItem _$FeedItemFromJson(Map<String, dynamic> json) {
  return _FeedItem.fromJson(json);
}

/// @nodoc
mixin _$FeedItem {
  String get id => throw _privateConstructorUsedError;
  String get creatorName => throw _privateConstructorUsedError;
  String get creatorHandle => throw _privateConstructorUsedError;
  String get creatorAvatarUrl => throw _privateConstructorUsedError;
  String get thumbnailUrl => throw _privateConstructorUsedError;
  String get videoTitle => throw _privateConstructorUsedError;
  String get targetLanguage => throw _privateConstructorUsedError;
  String get nativeLanguageTranslation => throw _privateConstructorUsedError;
  String get difficultyLevel => throw _privateConstructorUsedError;
  int get durationSeconds => throw _privateConstructorUsedError;
  List<SubtitleSegment> get subtitleSegments =>
      throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  int get likesCount => throw _privateConstructorUsedError;
  int get commentsCount => throw _privateConstructorUsedError;
  bool get isLiked => throw _privateConstructorUsedError;
  bool get isSaved => throw _privateConstructorUsedError;
  int get viewCount => throw _privateConstructorUsedError;

  /// Serializes this FeedItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedItemCopyWith<FeedItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedItemCopyWith<$Res> {
  factory $FeedItemCopyWith(FeedItem value, $Res Function(FeedItem) then) =
      _$FeedItemCopyWithImpl<$Res, FeedItem>;
  @useResult
  $Res call(
      {String id,
      String creatorName,
      String creatorHandle,
      String creatorAvatarUrl,
      String thumbnailUrl,
      String videoTitle,
      String targetLanguage,
      String nativeLanguageTranslation,
      String difficultyLevel,
      int durationSeconds,
      List<SubtitleSegment> subtitleSegments,
      List<String> tags,
      int likesCount,
      int commentsCount,
      bool isLiked,
      bool isSaved,
      int viewCount});
}

/// @nodoc
class _$FeedItemCopyWithImpl<$Res, $Val extends FeedItem>
    implements $FeedItemCopyWith<$Res> {
  _$FeedItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creatorName = null,
    Object? creatorHandle = null,
    Object? creatorAvatarUrl = null,
    Object? thumbnailUrl = null,
    Object? videoTitle = null,
    Object? targetLanguage = null,
    Object? nativeLanguageTranslation = null,
    Object? difficultyLevel = null,
    Object? durationSeconds = null,
    Object? subtitleSegments = null,
    Object? tags = null,
    Object? likesCount = null,
    Object? commentsCount = null,
    Object? isLiked = null,
    Object? isSaved = null,
    Object? viewCount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creatorName: null == creatorName
          ? _value.creatorName
          : creatorName // ignore: cast_nullable_to_non_nullable
              as String,
      creatorHandle: null == creatorHandle
          ? _value.creatorHandle
          : creatorHandle // ignore: cast_nullable_to_non_nullable
              as String,
      creatorAvatarUrl: null == creatorAvatarUrl
          ? _value.creatorAvatarUrl
          : creatorAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      videoTitle: null == videoTitle
          ? _value.videoTitle
          : videoTitle // ignore: cast_nullable_to_non_nullable
              as String,
      targetLanguage: null == targetLanguage
          ? _value.targetLanguage
          : targetLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      nativeLanguageTranslation: null == nativeLanguageTranslation
          ? _value.nativeLanguageTranslation
          : nativeLanguageTranslation // ignore: cast_nullable_to_non_nullable
              as String,
      difficultyLevel: null == difficultyLevel
          ? _value.difficultyLevel
          : difficultyLevel // ignore: cast_nullable_to_non_nullable
              as String,
      durationSeconds: null == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      subtitleSegments: null == subtitleSegments
          ? _value.subtitleSegments
          : subtitleSegments // ignore: cast_nullable_to_non_nullable
              as List<SubtitleSegment>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      likesCount: null == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeedItemImplCopyWith<$Res>
    implements $FeedItemCopyWith<$Res> {
  factory _$$FeedItemImplCopyWith(
          _$FeedItemImpl value, $Res Function(_$FeedItemImpl) then) =
      __$$FeedItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String creatorName,
      String creatorHandle,
      String creatorAvatarUrl,
      String thumbnailUrl,
      String videoTitle,
      String targetLanguage,
      String nativeLanguageTranslation,
      String difficultyLevel,
      int durationSeconds,
      List<SubtitleSegment> subtitleSegments,
      List<String> tags,
      int likesCount,
      int commentsCount,
      bool isLiked,
      bool isSaved,
      int viewCount});
}

/// @nodoc
class __$$FeedItemImplCopyWithImpl<$Res>
    extends _$FeedItemCopyWithImpl<$Res, _$FeedItemImpl>
    implements _$$FeedItemImplCopyWith<$Res> {
  __$$FeedItemImplCopyWithImpl(
      _$FeedItemImpl _value, $Res Function(_$FeedItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeedItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creatorName = null,
    Object? creatorHandle = null,
    Object? creatorAvatarUrl = null,
    Object? thumbnailUrl = null,
    Object? videoTitle = null,
    Object? targetLanguage = null,
    Object? nativeLanguageTranslation = null,
    Object? difficultyLevel = null,
    Object? durationSeconds = null,
    Object? subtitleSegments = null,
    Object? tags = null,
    Object? likesCount = null,
    Object? commentsCount = null,
    Object? isLiked = null,
    Object? isSaved = null,
    Object? viewCount = null,
  }) {
    return _then(_$FeedItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creatorName: null == creatorName
          ? _value.creatorName
          : creatorName // ignore: cast_nullable_to_non_nullable
              as String,
      creatorHandle: null == creatorHandle
          ? _value.creatorHandle
          : creatorHandle // ignore: cast_nullable_to_non_nullable
              as String,
      creatorAvatarUrl: null == creatorAvatarUrl
          ? _value.creatorAvatarUrl
          : creatorAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      videoTitle: null == videoTitle
          ? _value.videoTitle
          : videoTitle // ignore: cast_nullable_to_non_nullable
              as String,
      targetLanguage: null == targetLanguage
          ? _value.targetLanguage
          : targetLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      nativeLanguageTranslation: null == nativeLanguageTranslation
          ? _value.nativeLanguageTranslation
          : nativeLanguageTranslation // ignore: cast_nullable_to_non_nullable
              as String,
      difficultyLevel: null == difficultyLevel
          ? _value.difficultyLevel
          : difficultyLevel // ignore: cast_nullable_to_non_nullable
              as String,
      durationSeconds: null == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      subtitleSegments: null == subtitleSegments
          ? _value._subtitleSegments
          : subtitleSegments // ignore: cast_nullable_to_non_nullable
              as List<SubtitleSegment>,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      likesCount: null == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedItemImpl implements _FeedItem {
  const _$FeedItemImpl(
      {required this.id,
      required this.creatorName,
      required this.creatorHandle,
      required this.creatorAvatarUrl,
      required this.thumbnailUrl,
      required this.videoTitle,
      required this.targetLanguage,
      required this.nativeLanguageTranslation,
      required this.difficultyLevel,
      required this.durationSeconds,
      final List<SubtitleSegment> subtitleSegments = const [],
      final List<String> tags = const [],
      this.likesCount = 0,
      this.commentsCount = 0,
      this.isLiked = false,
      this.isSaved = false,
      this.viewCount = 0})
      : _subtitleSegments = subtitleSegments,
        _tags = tags;

  factory _$FeedItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedItemImplFromJson(json);

  @override
  final String id;
  @override
  final String creatorName;
  @override
  final String creatorHandle;
  @override
  final String creatorAvatarUrl;
  @override
  final String thumbnailUrl;
  @override
  final String videoTitle;
  @override
  final String targetLanguage;
  @override
  final String nativeLanguageTranslation;
  @override
  final String difficultyLevel;
  @override
  final int durationSeconds;
  final List<SubtitleSegment> _subtitleSegments;
  @override
  @JsonKey()
  List<SubtitleSegment> get subtitleSegments {
    if (_subtitleSegments is EqualUnmodifiableListView)
      return _subtitleSegments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subtitleSegments);
  }

  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @JsonKey()
  final int likesCount;
  @override
  @JsonKey()
  final int commentsCount;
  @override
  @JsonKey()
  final bool isLiked;
  @override
  @JsonKey()
  final bool isSaved;
  @override
  @JsonKey()
  final int viewCount;

  @override
  String toString() {
    return 'FeedItem(id: $id, creatorName: $creatorName, creatorHandle: $creatorHandle, creatorAvatarUrl: $creatorAvatarUrl, thumbnailUrl: $thumbnailUrl, videoTitle: $videoTitle, targetLanguage: $targetLanguage, nativeLanguageTranslation: $nativeLanguageTranslation, difficultyLevel: $difficultyLevel, durationSeconds: $durationSeconds, subtitleSegments: $subtitleSegments, tags: $tags, likesCount: $likesCount, commentsCount: $commentsCount, isLiked: $isLiked, isSaved: $isSaved, viewCount: $viewCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.creatorName, creatorName) ||
                other.creatorName == creatorName) &&
            (identical(other.creatorHandle, creatorHandle) ||
                other.creatorHandle == creatorHandle) &&
            (identical(other.creatorAvatarUrl, creatorAvatarUrl) ||
                other.creatorAvatarUrl == creatorAvatarUrl) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.videoTitle, videoTitle) ||
                other.videoTitle == videoTitle) &&
            (identical(other.targetLanguage, targetLanguage) ||
                other.targetLanguage == targetLanguage) &&
            (identical(other.nativeLanguageTranslation,
                    nativeLanguageTranslation) ||
                other.nativeLanguageTranslation == nativeLanguageTranslation) &&
            (identical(other.difficultyLevel, difficultyLevel) ||
                other.difficultyLevel == difficultyLevel) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds) &&
            const DeepCollectionEquality()
                .equals(other._subtitleSegments, _subtitleSegments) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            (identical(other.commentsCount, commentsCount) ||
                other.commentsCount == commentsCount) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      creatorName,
      creatorHandle,
      creatorAvatarUrl,
      thumbnailUrl,
      videoTitle,
      targetLanguage,
      nativeLanguageTranslation,
      difficultyLevel,
      durationSeconds,
      const DeepCollectionEquality().hash(_subtitleSegments),
      const DeepCollectionEquality().hash(_tags),
      likesCount,
      commentsCount,
      isLiked,
      isSaved,
      viewCount);

  /// Create a copy of FeedItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedItemImplCopyWith<_$FeedItemImpl> get copyWith =>
      __$$FeedItemImplCopyWithImpl<_$FeedItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedItemImplToJson(
      this,
    );
  }
}

abstract class _FeedItem implements FeedItem {
  const factory _FeedItem(
      {required final String id,
      required final String creatorName,
      required final String creatorHandle,
      required final String creatorAvatarUrl,
      required final String thumbnailUrl,
      required final String videoTitle,
      required final String targetLanguage,
      required final String nativeLanguageTranslation,
      required final String difficultyLevel,
      required final int durationSeconds,
      final List<SubtitleSegment> subtitleSegments,
      final List<String> tags,
      final int likesCount,
      final int commentsCount,
      final bool isLiked,
      final bool isSaved,
      final int viewCount}) = _$FeedItemImpl;

  factory _FeedItem.fromJson(Map<String, dynamic> json) =
      _$FeedItemImpl.fromJson;

  @override
  String get id;
  @override
  String get creatorName;
  @override
  String get creatorHandle;
  @override
  String get creatorAvatarUrl;
  @override
  String get thumbnailUrl;
  @override
  String get videoTitle;
  @override
  String get targetLanguage;
  @override
  String get nativeLanguageTranslation;
  @override
  String get difficultyLevel;
  @override
  int get durationSeconds;
  @override
  List<SubtitleSegment> get subtitleSegments;
  @override
  List<String> get tags;
  @override
  int get likesCount;
  @override
  int get commentsCount;
  @override
  bool get isLiked;
  @override
  bool get isSaved;
  @override
  int get viewCount;

  /// Create a copy of FeedItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedItemImplCopyWith<_$FeedItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

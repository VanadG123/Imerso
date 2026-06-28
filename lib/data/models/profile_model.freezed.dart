// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Achievement {
  String get id => throw _privateConstructorUsedError;
  String get emoji => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get isEarned => throw _privateConstructorUsedError;
  DateTime? get earnedAt => throw _privateConstructorUsedError;

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AchievementCopyWith<Achievement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AchievementCopyWith<$Res> {
  factory $AchievementCopyWith(
          Achievement value, $Res Function(Achievement) then) =
      _$AchievementCopyWithImpl<$Res, Achievement>;
  @useResult
  $Res call(
      {String id,
      String emoji,
      String name,
      String description,
      bool isEarned,
      DateTime? earnedAt});
}

/// @nodoc
class _$AchievementCopyWithImpl<$Res, $Val extends Achievement>
    implements $AchievementCopyWith<$Res> {
  _$AchievementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? emoji = null,
    Object? name = null,
    Object? description = null,
    Object? isEarned = null,
    Object? earnedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      emoji: null == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isEarned: null == isEarned
          ? _value.isEarned
          : isEarned // ignore: cast_nullable_to_non_nullable
              as bool,
      earnedAt: freezed == earnedAt
          ? _value.earnedAt
          : earnedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AchievementImplCopyWith<$Res>
    implements $AchievementCopyWith<$Res> {
  factory _$$AchievementImplCopyWith(
          _$AchievementImpl value, $Res Function(_$AchievementImpl) then) =
      __$$AchievementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String emoji,
      String name,
      String description,
      bool isEarned,
      DateTime? earnedAt});
}

/// @nodoc
class __$$AchievementImplCopyWithImpl<$Res>
    extends _$AchievementCopyWithImpl<$Res, _$AchievementImpl>
    implements _$$AchievementImplCopyWith<$Res> {
  __$$AchievementImplCopyWithImpl(
      _$AchievementImpl _value, $Res Function(_$AchievementImpl) _then)
      : super(_value, _then);

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? emoji = null,
    Object? name = null,
    Object? description = null,
    Object? isEarned = null,
    Object? earnedAt = freezed,
  }) {
    return _then(_$AchievementImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      emoji: null == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isEarned: null == isEarned
          ? _value.isEarned
          : isEarned // ignore: cast_nullable_to_non_nullable
              as bool,
      earnedAt: freezed == earnedAt
          ? _value.earnedAt
          : earnedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$AchievementImpl implements _Achievement {
  const _$AchievementImpl(
      {required this.id,
      required this.emoji,
      required this.name,
      required this.description,
      required this.isEarned,
      this.earnedAt});

  @override
  final String id;
  @override
  final String emoji;
  @override
  final String name;
  @override
  final String description;
  @override
  final bool isEarned;
  @override
  final DateTime? earnedAt;

  @override
  String toString() {
    return 'Achievement(id: $id, emoji: $emoji, name: $name, description: $description, isEarned: $isEarned, earnedAt: $earnedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AchievementImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.emoji, emoji) || other.emoji == emoji) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isEarned, isEarned) ||
                other.isEarned == isEarned) &&
            (identical(other.earnedAt, earnedAt) ||
                other.earnedAt == earnedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, emoji, name, description, isEarned, earnedAt);

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AchievementImplCopyWith<_$AchievementImpl> get copyWith =>
      __$$AchievementImplCopyWithImpl<_$AchievementImpl>(this, _$identity);
}

abstract class _Achievement implements Achievement {
  const factory _Achievement(
      {required final String id,
      required final String emoji,
      required final String name,
      required final String description,
      required final bool isEarned,
      final DateTime? earnedAt}) = _$AchievementImpl;

  @override
  String get id;
  @override
  String get emoji;
  @override
  String get name;
  @override
  String get description;
  @override
  bool get isEarned;
  @override
  DateTime? get earnedAt;

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AchievementImplCopyWith<_$AchievementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserProfile {
  String get id => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String get handle => throw _privateConstructorUsedError;
  String get avatarUrl => throw _privateConstructorUsedError;
  String get nativeLanguage => throw _privateConstructorUsedError;
  String get targetLanguage => throw _privateConstructorUsedError;
  String get currentLevel => throw _privateConstructorUsedError;
  double get levelProgressPercent => throw _privateConstructorUsedError;
  int get totalVideosWatched => throw _privateConstructorUsedError;
  int get totalWordsLearned => throw _privateConstructorUsedError;
  int get currentStreakDays => throw _privateConstructorUsedError;
  List<Achievement> get achievements => throw _privateConstructorUsedError;
  List<String> get savedVideoThumbnails => throw _privateConstructorUsedError;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call(
      {String id,
      String displayName,
      String handle,
      String avatarUrl,
      String nativeLanguage,
      String targetLanguage,
      String currentLevel,
      double levelProgressPercent,
      int totalVideosWatched,
      int totalWordsLearned,
      int currentStreakDays,
      List<Achievement> achievements,
      List<String> savedVideoThumbnails});
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? handle = null,
    Object? avatarUrl = null,
    Object? nativeLanguage = null,
    Object? targetLanguage = null,
    Object? currentLevel = null,
    Object? levelProgressPercent = null,
    Object? totalVideosWatched = null,
    Object? totalWordsLearned = null,
    Object? currentStreakDays = null,
    Object? achievements = null,
    Object? savedVideoThumbnails = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      handle: null == handle
          ? _value.handle
          : handle // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      nativeLanguage: null == nativeLanguage
          ? _value.nativeLanguage
          : nativeLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      targetLanguage: null == targetLanguage
          ? _value.targetLanguage
          : targetLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      currentLevel: null == currentLevel
          ? _value.currentLevel
          : currentLevel // ignore: cast_nullable_to_non_nullable
              as String,
      levelProgressPercent: null == levelProgressPercent
          ? _value.levelProgressPercent
          : levelProgressPercent // ignore: cast_nullable_to_non_nullable
              as double,
      totalVideosWatched: null == totalVideosWatched
          ? _value.totalVideosWatched
          : totalVideosWatched // ignore: cast_nullable_to_non_nullable
              as int,
      totalWordsLearned: null == totalWordsLearned
          ? _value.totalWordsLearned
          : totalWordsLearned // ignore: cast_nullable_to_non_nullable
              as int,
      currentStreakDays: null == currentStreakDays
          ? _value.currentStreakDays
          : currentStreakDays // ignore: cast_nullable_to_non_nullable
              as int,
      achievements: null == achievements
          ? _value.achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as List<Achievement>,
      savedVideoThumbnails: null == savedVideoThumbnails
          ? _value.savedVideoThumbnails
          : savedVideoThumbnails // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProfileImplCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$UserProfileImplCopyWith(
          _$UserProfileImpl value, $Res Function(_$UserProfileImpl) then) =
      __$$UserProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String displayName,
      String handle,
      String avatarUrl,
      String nativeLanguage,
      String targetLanguage,
      String currentLevel,
      double levelProgressPercent,
      int totalVideosWatched,
      int totalWordsLearned,
      int currentStreakDays,
      List<Achievement> achievements,
      List<String> savedVideoThumbnails});
}

/// @nodoc
class __$$UserProfileImplCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$UserProfileImpl>
    implements _$$UserProfileImplCopyWith<$Res> {
  __$$UserProfileImplCopyWithImpl(
      _$UserProfileImpl _value, $Res Function(_$UserProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? handle = null,
    Object? avatarUrl = null,
    Object? nativeLanguage = null,
    Object? targetLanguage = null,
    Object? currentLevel = null,
    Object? levelProgressPercent = null,
    Object? totalVideosWatched = null,
    Object? totalWordsLearned = null,
    Object? currentStreakDays = null,
    Object? achievements = null,
    Object? savedVideoThumbnails = null,
  }) {
    return _then(_$UserProfileImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      handle: null == handle
          ? _value.handle
          : handle // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      nativeLanguage: null == nativeLanguage
          ? _value.nativeLanguage
          : nativeLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      targetLanguage: null == targetLanguage
          ? _value.targetLanguage
          : targetLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      currentLevel: null == currentLevel
          ? _value.currentLevel
          : currentLevel // ignore: cast_nullable_to_non_nullable
              as String,
      levelProgressPercent: null == levelProgressPercent
          ? _value.levelProgressPercent
          : levelProgressPercent // ignore: cast_nullable_to_non_nullable
              as double,
      totalVideosWatched: null == totalVideosWatched
          ? _value.totalVideosWatched
          : totalVideosWatched // ignore: cast_nullable_to_non_nullable
              as int,
      totalWordsLearned: null == totalWordsLearned
          ? _value.totalWordsLearned
          : totalWordsLearned // ignore: cast_nullable_to_non_nullable
              as int,
      currentStreakDays: null == currentStreakDays
          ? _value.currentStreakDays
          : currentStreakDays // ignore: cast_nullable_to_non_nullable
              as int,
      achievements: null == achievements
          ? _value._achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as List<Achievement>,
      savedVideoThumbnails: null == savedVideoThumbnails
          ? _value._savedVideoThumbnails
          : savedVideoThumbnails // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$UserProfileImpl implements _UserProfile {
  const _$UserProfileImpl(
      {required this.id,
      required this.displayName,
      required this.handle,
      required this.avatarUrl,
      required this.nativeLanguage,
      required this.targetLanguage,
      required this.currentLevel,
      required this.levelProgressPercent,
      required this.totalVideosWatched,
      required this.totalWordsLearned,
      required this.currentStreakDays,
      required final List<Achievement> achievements,
      required final List<String> savedVideoThumbnails})
      : _achievements = achievements,
        _savedVideoThumbnails = savedVideoThumbnails;

  @override
  final String id;
  @override
  final String displayName;
  @override
  final String handle;
  @override
  final String avatarUrl;
  @override
  final String nativeLanguage;
  @override
  final String targetLanguage;
  @override
  final String currentLevel;
  @override
  final double levelProgressPercent;
  @override
  final int totalVideosWatched;
  @override
  final int totalWordsLearned;
  @override
  final int currentStreakDays;
  final List<Achievement> _achievements;
  @override
  List<Achievement> get achievements {
    if (_achievements is EqualUnmodifiableListView) return _achievements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_achievements);
  }

  final List<String> _savedVideoThumbnails;
  @override
  List<String> get savedVideoThumbnails {
    if (_savedVideoThumbnails is EqualUnmodifiableListView)
      return _savedVideoThumbnails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_savedVideoThumbnails);
  }

  @override
  String toString() {
    return 'UserProfile(id: $id, displayName: $displayName, handle: $handle, avatarUrl: $avatarUrl, nativeLanguage: $nativeLanguage, targetLanguage: $targetLanguage, currentLevel: $currentLevel, levelProgressPercent: $levelProgressPercent, totalVideosWatched: $totalVideosWatched, totalWordsLearned: $totalWordsLearned, currentStreakDays: $currentStreakDays, achievements: $achievements, savedVideoThumbnails: $savedVideoThumbnails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.handle, handle) || other.handle == handle) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.nativeLanguage, nativeLanguage) ||
                other.nativeLanguage == nativeLanguage) &&
            (identical(other.targetLanguage, targetLanguage) ||
                other.targetLanguage == targetLanguage) &&
            (identical(other.currentLevel, currentLevel) ||
                other.currentLevel == currentLevel) &&
            (identical(other.levelProgressPercent, levelProgressPercent) ||
                other.levelProgressPercent == levelProgressPercent) &&
            (identical(other.totalVideosWatched, totalVideosWatched) ||
                other.totalVideosWatched == totalVideosWatched) &&
            (identical(other.totalWordsLearned, totalWordsLearned) ||
                other.totalWordsLearned == totalWordsLearned) &&
            (identical(other.currentStreakDays, currentStreakDays) ||
                other.currentStreakDays == currentStreakDays) &&
            const DeepCollectionEquality()
                .equals(other._achievements, _achievements) &&
            const DeepCollectionEquality()
                .equals(other._savedVideoThumbnails, _savedVideoThumbnails));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      displayName,
      handle,
      avatarUrl,
      nativeLanguage,
      targetLanguage,
      currentLevel,
      levelProgressPercent,
      totalVideosWatched,
      totalWordsLearned,
      currentStreakDays,
      const DeepCollectionEquality().hash(_achievements),
      const DeepCollectionEquality().hash(_savedVideoThumbnails));

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      __$$UserProfileImplCopyWithImpl<_$UserProfileImpl>(this, _$identity);
}

abstract class _UserProfile implements UserProfile {
  const factory _UserProfile(
      {required final String id,
      required final String displayName,
      required final String handle,
      required final String avatarUrl,
      required final String nativeLanguage,
      required final String targetLanguage,
      required final String currentLevel,
      required final double levelProgressPercent,
      required final int totalVideosWatched,
      required final int totalWordsLearned,
      required final int currentStreakDays,
      required final List<Achievement> achievements,
      required final List<String> savedVideoThumbnails}) = _$UserProfileImpl;

  @override
  String get id;
  @override
  String get displayName;
  @override
  String get handle;
  @override
  String get avatarUrl;
  @override
  String get nativeLanguage;
  @override
  String get targetLanguage;
  @override
  String get currentLevel;
  @override
  double get levelProgressPercent;
  @override
  int get totalVideosWatched;
  @override
  int get totalWordsLearned;
  @override
  int get currentStreakDays;
  @override
  List<Achievement> get achievements;
  @override
  List<String> get savedVideoThumbnails;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

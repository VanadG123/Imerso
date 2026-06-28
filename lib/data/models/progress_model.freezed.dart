// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DayActivity {
  DateTime get date => throw _privateConstructorUsedError;
  int get minutesWatched => throw _privateConstructorUsedError;
  int get wordsLearned => throw _privateConstructorUsedError;

  /// Create a copy of DayActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DayActivityCopyWith<DayActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayActivityCopyWith<$Res> {
  factory $DayActivityCopyWith(
          DayActivity value, $Res Function(DayActivity) then) =
      _$DayActivityCopyWithImpl<$Res, DayActivity>;
  @useResult
  $Res call({DateTime date, int minutesWatched, int wordsLearned});
}

/// @nodoc
class _$DayActivityCopyWithImpl<$Res, $Val extends DayActivity>
    implements $DayActivityCopyWith<$Res> {
  _$DayActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DayActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? minutesWatched = null,
    Object? wordsLearned = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      minutesWatched: null == minutesWatched
          ? _value.minutesWatched
          : minutesWatched // ignore: cast_nullable_to_non_nullable
              as int,
      wordsLearned: null == wordsLearned
          ? _value.wordsLearned
          : wordsLearned // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DayActivityImplCopyWith<$Res>
    implements $DayActivityCopyWith<$Res> {
  factory _$$DayActivityImplCopyWith(
          _$DayActivityImpl value, $Res Function(_$DayActivityImpl) then) =
      __$$DayActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, int minutesWatched, int wordsLearned});
}

/// @nodoc
class __$$DayActivityImplCopyWithImpl<$Res>
    extends _$DayActivityCopyWithImpl<$Res, _$DayActivityImpl>
    implements _$$DayActivityImplCopyWith<$Res> {
  __$$DayActivityImplCopyWithImpl(
      _$DayActivityImpl _value, $Res Function(_$DayActivityImpl) _then)
      : super(_value, _then);

  /// Create a copy of DayActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? minutesWatched = null,
    Object? wordsLearned = null,
  }) {
    return _then(_$DayActivityImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      minutesWatched: null == minutesWatched
          ? _value.minutesWatched
          : minutesWatched // ignore: cast_nullable_to_non_nullable
              as int,
      wordsLearned: null == wordsLearned
          ? _value.wordsLearned
          : wordsLearned // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DayActivityImpl implements _DayActivity {
  const _$DayActivityImpl(
      {required this.date,
      required this.minutesWatched,
      required this.wordsLearned});

  @override
  final DateTime date;
  @override
  final int minutesWatched;
  @override
  final int wordsLearned;

  @override
  String toString() {
    return 'DayActivity(date: $date, minutesWatched: $minutesWatched, wordsLearned: $wordsLearned)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DayActivityImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.minutesWatched, minutesWatched) ||
                other.minutesWatched == minutesWatched) &&
            (identical(other.wordsLearned, wordsLearned) ||
                other.wordsLearned == wordsLearned));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, date, minutesWatched, wordsLearned);

  /// Create a copy of DayActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DayActivityImplCopyWith<_$DayActivityImpl> get copyWith =>
      __$$DayActivityImplCopyWithImpl<_$DayActivityImpl>(this, _$identity);
}

abstract class _DayActivity implements DayActivity {
  const factory _DayActivity(
      {required final DateTime date,
      required final int minutesWatched,
      required final int wordsLearned}) = _$DayActivityImpl;

  @override
  DateTime get date;
  @override
  int get minutesWatched;
  @override
  int get wordsLearned;

  /// Create a copy of DayActivity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DayActivityImplCopyWith<_$DayActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LanguageStat {
  String get language => throw _privateConstructorUsedError;
  int get minutesWatched => throw _privateConstructorUsedError;
  int get wordsLearned => throw _privateConstructorUsedError;
  int get colorValue => throw _privateConstructorUsedError;

  /// Create a copy of LanguageStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LanguageStatCopyWith<LanguageStat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguageStatCopyWith<$Res> {
  factory $LanguageStatCopyWith(
          LanguageStat value, $Res Function(LanguageStat) then) =
      _$LanguageStatCopyWithImpl<$Res, LanguageStat>;
  @useResult
  $Res call(
      {String language, int minutesWatched, int wordsLearned, int colorValue});
}

/// @nodoc
class _$LanguageStatCopyWithImpl<$Res, $Val extends LanguageStat>
    implements $LanguageStatCopyWith<$Res> {
  _$LanguageStatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LanguageStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
    Object? minutesWatched = null,
    Object? wordsLearned = null,
    Object? colorValue = null,
  }) {
    return _then(_value.copyWith(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      minutesWatched: null == minutesWatched
          ? _value.minutesWatched
          : minutesWatched // ignore: cast_nullable_to_non_nullable
              as int,
      wordsLearned: null == wordsLearned
          ? _value.wordsLearned
          : wordsLearned // ignore: cast_nullable_to_non_nullable
              as int,
      colorValue: null == colorValue
          ? _value.colorValue
          : colorValue // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LanguageStatImplCopyWith<$Res>
    implements $LanguageStatCopyWith<$Res> {
  factory _$$LanguageStatImplCopyWith(
          _$LanguageStatImpl value, $Res Function(_$LanguageStatImpl) then) =
      __$$LanguageStatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String language, int minutesWatched, int wordsLearned, int colorValue});
}

/// @nodoc
class __$$LanguageStatImplCopyWithImpl<$Res>
    extends _$LanguageStatCopyWithImpl<$Res, _$LanguageStatImpl>
    implements _$$LanguageStatImplCopyWith<$Res> {
  __$$LanguageStatImplCopyWithImpl(
      _$LanguageStatImpl _value, $Res Function(_$LanguageStatImpl) _then)
      : super(_value, _then);

  /// Create a copy of LanguageStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
    Object? minutesWatched = null,
    Object? wordsLearned = null,
    Object? colorValue = null,
  }) {
    return _then(_$LanguageStatImpl(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      minutesWatched: null == minutesWatched
          ? _value.minutesWatched
          : minutesWatched // ignore: cast_nullable_to_non_nullable
              as int,
      wordsLearned: null == wordsLearned
          ? _value.wordsLearned
          : wordsLearned // ignore: cast_nullable_to_non_nullable
              as int,
      colorValue: null == colorValue
          ? _value.colorValue
          : colorValue // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LanguageStatImpl implements _LanguageStat {
  const _$LanguageStatImpl(
      {required this.language,
      required this.minutesWatched,
      required this.wordsLearned,
      required this.colorValue});

  @override
  final String language;
  @override
  final int minutesWatched;
  @override
  final int wordsLearned;
  @override
  final int colorValue;

  @override
  String toString() {
    return 'LanguageStat(language: $language, minutesWatched: $minutesWatched, wordsLearned: $wordsLearned, colorValue: $colorValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LanguageStatImpl &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.minutesWatched, minutesWatched) ||
                other.minutesWatched == minutesWatched) &&
            (identical(other.wordsLearned, wordsLearned) ||
                other.wordsLearned == wordsLearned) &&
            (identical(other.colorValue, colorValue) ||
                other.colorValue == colorValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, language, minutesWatched, wordsLearned, colorValue);

  /// Create a copy of LanguageStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LanguageStatImplCopyWith<_$LanguageStatImpl> get copyWith =>
      __$$LanguageStatImplCopyWithImpl<_$LanguageStatImpl>(this, _$identity);
}

abstract class _LanguageStat implements LanguageStat {
  const factory _LanguageStat(
      {required final String language,
      required final int minutesWatched,
      required final int wordsLearned,
      required final int colorValue}) = _$LanguageStatImpl;

  @override
  String get language;
  @override
  int get minutesWatched;
  @override
  int get wordsLearned;
  @override
  int get colorValue;

  /// Create a copy of LanguageStat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LanguageStatImplCopyWith<_$LanguageStatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserProgress {
  int get totalImmersionMinutes => throw _privateConstructorUsedError;
  int get currentStreakDays => throw _privateConstructorUsedError;
  int get longestStreakDays => throw _privateConstructorUsedError;
  int get vocabularyLearned => throw _privateConstructorUsedError;
  int get vocabularyMastered => throw _privateConstructorUsedError;
  int get videosWatched => throw _privateConstructorUsedError;
  String get currentLevel => throw _privateConstructorUsedError;
  String get targetLevel => throw _privateConstructorUsedError;
  double get levelProgressPercent => throw _privateConstructorUsedError;
  List<DayActivity> get weeklyActivity => throw _privateConstructorUsedError;
  List<int> get monthlyMinutes => throw _privateConstructorUsedError;
  List<LanguageStat> get languageBreakdown =>
      throw _privateConstructorUsedError;

  /// Create a copy of UserProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProgressCopyWith<UserProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProgressCopyWith<$Res> {
  factory $UserProgressCopyWith(
          UserProgress value, $Res Function(UserProgress) then) =
      _$UserProgressCopyWithImpl<$Res, UserProgress>;
  @useResult
  $Res call(
      {int totalImmersionMinutes,
      int currentStreakDays,
      int longestStreakDays,
      int vocabularyLearned,
      int vocabularyMastered,
      int videosWatched,
      String currentLevel,
      String targetLevel,
      double levelProgressPercent,
      List<DayActivity> weeklyActivity,
      List<int> monthlyMinutes,
      List<LanguageStat> languageBreakdown});
}

/// @nodoc
class _$UserProgressCopyWithImpl<$Res, $Val extends UserProgress>
    implements $UserProgressCopyWith<$Res> {
  _$UserProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalImmersionMinutes = null,
    Object? currentStreakDays = null,
    Object? longestStreakDays = null,
    Object? vocabularyLearned = null,
    Object? vocabularyMastered = null,
    Object? videosWatched = null,
    Object? currentLevel = null,
    Object? targetLevel = null,
    Object? levelProgressPercent = null,
    Object? weeklyActivity = null,
    Object? monthlyMinutes = null,
    Object? languageBreakdown = null,
  }) {
    return _then(_value.copyWith(
      totalImmersionMinutes: null == totalImmersionMinutes
          ? _value.totalImmersionMinutes
          : totalImmersionMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      currentStreakDays: null == currentStreakDays
          ? _value.currentStreakDays
          : currentStreakDays // ignore: cast_nullable_to_non_nullable
              as int,
      longestStreakDays: null == longestStreakDays
          ? _value.longestStreakDays
          : longestStreakDays // ignore: cast_nullable_to_non_nullable
              as int,
      vocabularyLearned: null == vocabularyLearned
          ? _value.vocabularyLearned
          : vocabularyLearned // ignore: cast_nullable_to_non_nullable
              as int,
      vocabularyMastered: null == vocabularyMastered
          ? _value.vocabularyMastered
          : vocabularyMastered // ignore: cast_nullable_to_non_nullable
              as int,
      videosWatched: null == videosWatched
          ? _value.videosWatched
          : videosWatched // ignore: cast_nullable_to_non_nullable
              as int,
      currentLevel: null == currentLevel
          ? _value.currentLevel
          : currentLevel // ignore: cast_nullable_to_non_nullable
              as String,
      targetLevel: null == targetLevel
          ? _value.targetLevel
          : targetLevel // ignore: cast_nullable_to_non_nullable
              as String,
      levelProgressPercent: null == levelProgressPercent
          ? _value.levelProgressPercent
          : levelProgressPercent // ignore: cast_nullable_to_non_nullable
              as double,
      weeklyActivity: null == weeklyActivity
          ? _value.weeklyActivity
          : weeklyActivity // ignore: cast_nullable_to_non_nullable
              as List<DayActivity>,
      monthlyMinutes: null == monthlyMinutes
          ? _value.monthlyMinutes
          : monthlyMinutes // ignore: cast_nullable_to_non_nullable
              as List<int>,
      languageBreakdown: null == languageBreakdown
          ? _value.languageBreakdown
          : languageBreakdown // ignore: cast_nullable_to_non_nullable
              as List<LanguageStat>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProgressImplCopyWith<$Res>
    implements $UserProgressCopyWith<$Res> {
  factory _$$UserProgressImplCopyWith(
          _$UserProgressImpl value, $Res Function(_$UserProgressImpl) then) =
      __$$UserProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalImmersionMinutes,
      int currentStreakDays,
      int longestStreakDays,
      int vocabularyLearned,
      int vocabularyMastered,
      int videosWatched,
      String currentLevel,
      String targetLevel,
      double levelProgressPercent,
      List<DayActivity> weeklyActivity,
      List<int> monthlyMinutes,
      List<LanguageStat> languageBreakdown});
}

/// @nodoc
class __$$UserProgressImplCopyWithImpl<$Res>
    extends _$UserProgressCopyWithImpl<$Res, _$UserProgressImpl>
    implements _$$UserProgressImplCopyWith<$Res> {
  __$$UserProgressImplCopyWithImpl(
      _$UserProgressImpl _value, $Res Function(_$UserProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalImmersionMinutes = null,
    Object? currentStreakDays = null,
    Object? longestStreakDays = null,
    Object? vocabularyLearned = null,
    Object? vocabularyMastered = null,
    Object? videosWatched = null,
    Object? currentLevel = null,
    Object? targetLevel = null,
    Object? levelProgressPercent = null,
    Object? weeklyActivity = null,
    Object? monthlyMinutes = null,
    Object? languageBreakdown = null,
  }) {
    return _then(_$UserProgressImpl(
      totalImmersionMinutes: null == totalImmersionMinutes
          ? _value.totalImmersionMinutes
          : totalImmersionMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      currentStreakDays: null == currentStreakDays
          ? _value.currentStreakDays
          : currentStreakDays // ignore: cast_nullable_to_non_nullable
              as int,
      longestStreakDays: null == longestStreakDays
          ? _value.longestStreakDays
          : longestStreakDays // ignore: cast_nullable_to_non_nullable
              as int,
      vocabularyLearned: null == vocabularyLearned
          ? _value.vocabularyLearned
          : vocabularyLearned // ignore: cast_nullable_to_non_nullable
              as int,
      vocabularyMastered: null == vocabularyMastered
          ? _value.vocabularyMastered
          : vocabularyMastered // ignore: cast_nullable_to_non_nullable
              as int,
      videosWatched: null == videosWatched
          ? _value.videosWatched
          : videosWatched // ignore: cast_nullable_to_non_nullable
              as int,
      currentLevel: null == currentLevel
          ? _value.currentLevel
          : currentLevel // ignore: cast_nullable_to_non_nullable
              as String,
      targetLevel: null == targetLevel
          ? _value.targetLevel
          : targetLevel // ignore: cast_nullable_to_non_nullable
              as String,
      levelProgressPercent: null == levelProgressPercent
          ? _value.levelProgressPercent
          : levelProgressPercent // ignore: cast_nullable_to_non_nullable
              as double,
      weeklyActivity: null == weeklyActivity
          ? _value._weeklyActivity
          : weeklyActivity // ignore: cast_nullable_to_non_nullable
              as List<DayActivity>,
      monthlyMinutes: null == monthlyMinutes
          ? _value._monthlyMinutes
          : monthlyMinutes // ignore: cast_nullable_to_non_nullable
              as List<int>,
      languageBreakdown: null == languageBreakdown
          ? _value._languageBreakdown
          : languageBreakdown // ignore: cast_nullable_to_non_nullable
              as List<LanguageStat>,
    ));
  }
}

/// @nodoc

class _$UserProgressImpl implements _UserProgress {
  const _$UserProgressImpl(
      {required this.totalImmersionMinutes,
      required this.currentStreakDays,
      required this.longestStreakDays,
      required this.vocabularyLearned,
      required this.vocabularyMastered,
      required this.videosWatched,
      required this.currentLevel,
      required this.targetLevel,
      required this.levelProgressPercent,
      required final List<DayActivity> weeklyActivity,
      required final List<int> monthlyMinutes,
      required final List<LanguageStat> languageBreakdown})
      : _weeklyActivity = weeklyActivity,
        _monthlyMinutes = monthlyMinutes,
        _languageBreakdown = languageBreakdown;

  @override
  final int totalImmersionMinutes;
  @override
  final int currentStreakDays;
  @override
  final int longestStreakDays;
  @override
  final int vocabularyLearned;
  @override
  final int vocabularyMastered;
  @override
  final int videosWatched;
  @override
  final String currentLevel;
  @override
  final String targetLevel;
  @override
  final double levelProgressPercent;
  final List<DayActivity> _weeklyActivity;
  @override
  List<DayActivity> get weeklyActivity {
    if (_weeklyActivity is EqualUnmodifiableListView) return _weeklyActivity;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeklyActivity);
  }

  final List<int> _monthlyMinutes;
  @override
  List<int> get monthlyMinutes {
    if (_monthlyMinutes is EqualUnmodifiableListView) return _monthlyMinutes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_monthlyMinutes);
  }

  final List<LanguageStat> _languageBreakdown;
  @override
  List<LanguageStat> get languageBreakdown {
    if (_languageBreakdown is EqualUnmodifiableListView)
      return _languageBreakdown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_languageBreakdown);
  }

  @override
  String toString() {
    return 'UserProgress(totalImmersionMinutes: $totalImmersionMinutes, currentStreakDays: $currentStreakDays, longestStreakDays: $longestStreakDays, vocabularyLearned: $vocabularyLearned, vocabularyMastered: $vocabularyMastered, videosWatched: $videosWatched, currentLevel: $currentLevel, targetLevel: $targetLevel, levelProgressPercent: $levelProgressPercent, weeklyActivity: $weeklyActivity, monthlyMinutes: $monthlyMinutes, languageBreakdown: $languageBreakdown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProgressImpl &&
            (identical(other.totalImmersionMinutes, totalImmersionMinutes) ||
                other.totalImmersionMinutes == totalImmersionMinutes) &&
            (identical(other.currentStreakDays, currentStreakDays) ||
                other.currentStreakDays == currentStreakDays) &&
            (identical(other.longestStreakDays, longestStreakDays) ||
                other.longestStreakDays == longestStreakDays) &&
            (identical(other.vocabularyLearned, vocabularyLearned) ||
                other.vocabularyLearned == vocabularyLearned) &&
            (identical(other.vocabularyMastered, vocabularyMastered) ||
                other.vocabularyMastered == vocabularyMastered) &&
            (identical(other.videosWatched, videosWatched) ||
                other.videosWatched == videosWatched) &&
            (identical(other.currentLevel, currentLevel) ||
                other.currentLevel == currentLevel) &&
            (identical(other.targetLevel, targetLevel) ||
                other.targetLevel == targetLevel) &&
            (identical(other.levelProgressPercent, levelProgressPercent) ||
                other.levelProgressPercent == levelProgressPercent) &&
            const DeepCollectionEquality()
                .equals(other._weeklyActivity, _weeklyActivity) &&
            const DeepCollectionEquality()
                .equals(other._monthlyMinutes, _monthlyMinutes) &&
            const DeepCollectionEquality()
                .equals(other._languageBreakdown, _languageBreakdown));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalImmersionMinutes,
      currentStreakDays,
      longestStreakDays,
      vocabularyLearned,
      vocabularyMastered,
      videosWatched,
      currentLevel,
      targetLevel,
      levelProgressPercent,
      const DeepCollectionEquality().hash(_weeklyActivity),
      const DeepCollectionEquality().hash(_monthlyMinutes),
      const DeepCollectionEquality().hash(_languageBreakdown));

  /// Create a copy of UserProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProgressImplCopyWith<_$UserProgressImpl> get copyWith =>
      __$$UserProgressImplCopyWithImpl<_$UserProgressImpl>(this, _$identity);
}

abstract class _UserProgress implements UserProgress {
  const factory _UserProgress(
          {required final int totalImmersionMinutes,
          required final int currentStreakDays,
          required final int longestStreakDays,
          required final int vocabularyLearned,
          required final int vocabularyMastered,
          required final int videosWatched,
          required final String currentLevel,
          required final String targetLevel,
          required final double levelProgressPercent,
          required final List<DayActivity> weeklyActivity,
          required final List<int> monthlyMinutes,
          required final List<LanguageStat> languageBreakdown}) =
      _$UserProgressImpl;

  @override
  int get totalImmersionMinutes;
  @override
  int get currentStreakDays;
  @override
  int get longestStreakDays;
  @override
  int get vocabularyLearned;
  @override
  int get vocabularyMastered;
  @override
  int get videosWatched;
  @override
  String get currentLevel;
  @override
  String get targetLevel;
  @override
  double get levelProgressPercent;
  @override
  List<DayActivity> get weeklyActivity;
  @override
  List<int> get monthlyMinutes;
  @override
  List<LanguageStat> get languageBreakdown;

  /// Create a copy of UserProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProgressImplCopyWith<_$UserProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

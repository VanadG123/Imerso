import 'package:freezed_annotation/freezed_annotation.dart';

part 'progress_model.freezed.dart';

@freezed
class DayActivity with _$DayActivity {
  const factory DayActivity({
    required DateTime date,
    required int minutesWatched,
    required int wordsLearned,
  }) = _DayActivity;
}

@freezed
class LanguageStat with _$LanguageStat {
  const factory LanguageStat({
    required String language,
    required int minutesWatched,
    required int wordsLearned,
    required int colorValue,
  }) = _LanguageStat;
}

@freezed
class UserProgress with _$UserProgress {
  const factory UserProgress({
    required int totalImmersionMinutes,
    required int currentStreakDays,
    required int longestStreakDays,
    required int vocabularyLearned,
    required int vocabularyMastered,
    required int videosWatched,
    required String currentLevel,
    required String targetLevel,
    required double levelProgressPercent,
    required List<DayActivity> weeklyActivity,
    required List<int> monthlyMinutes,
    required List<LanguageStat> languageBreakdown,
  }) = _UserProgress;
}

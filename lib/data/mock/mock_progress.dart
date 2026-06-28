import '../models/progress_model.dart';

// Last 30 days of activity (index 0 = May 30, index 29 = Jun 28 / today).
// Last 7 entries (indices 23–29) must match weeklyActivity below.
const List<int> _monthlyMinutes = [
  35, 45,  0, 55, 30, 40,  0, 60, 45, 50, //  0–9  : May 30 – Jun 8
   0, 35, 90, 55,  0, 45, 30, 60, 50,  0, // 10–19 : Jun 9  – Jun 18
  45, 40, 45, 30, 55,  0, 40, 65, 80, 25, // 20–29 : Jun 19 – Jun 28
];

final UserProgress mockUserProgress = UserProgress(
  totalImmersionMinutes: 2340,
  currentStreakDays: 7,
  longestStreakDays: 14,
  vocabularyLearned: 247,
  vocabularyMastered: 89,
  videosWatched: 183,
  currentLevel: 'B1',
  targetLevel: 'B2',
  levelProgressPercent: 0.62,
  weeklyActivity: [
    DayActivity(date: DateTime(2026, 6, 22), minutesWatched: 30, wordsLearned: 8),
    DayActivity(date: DateTime(2026, 6, 23), minutesWatched: 55, wordsLearned: 14),
    DayActivity(date: DateTime(2026, 6, 24), minutesWatched: 0, wordsLearned: 0),
    DayActivity(date: DateTime(2026, 6, 25), minutesWatched: 40, wordsLearned: 10),
    DayActivity(date: DateTime(2026, 6, 26), minutesWatched: 65, wordsLearned: 16),
    DayActivity(date: DateTime(2026, 6, 27), minutesWatched: 80, wordsLearned: 20),
    DayActivity(date: DateTime(2026, 6, 28), minutesWatched: 25, wordsLearned: 6),
  ],
  monthlyMinutes: _monthlyMinutes,
  languageBreakdown: const [
    LanguageStat(
      language: 'Japanese',
      minutesWatched: 1340,
      wordsLearned: 142,
      colorValue: 0xFF7C3AED,
    ),
    LanguageStat(
      language: 'Spanish',
      minutesWatched: 680,
      wordsLearned: 71,
      colorValue: 0xFF06B6D4,
    ),
    LanguageStat(
      language: 'Korean',
      minutesWatched: 320,
      wordsLearned: 34,
      colorValue: 0xFFF472B6,
    ),
  ],
);

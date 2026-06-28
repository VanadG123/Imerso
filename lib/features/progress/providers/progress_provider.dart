import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/mock/mock_progress.dart';
import '../../../data/models/progress_model.dart';

part 'progress_provider.g.dart';

@riverpod
UserProgress userProgress(UserProgressRef ref) => mockUserProgress;

@riverpod
int todayMinutes(TodayMinutesRef ref) {
  final progress = ref.watch(userProgressProvider);
  final today = DateTime.now();
  return progress.weeklyActivity
      .where(
        (d) => d.date.day == today.day && d.date.month == today.month,
      )
      .fold(0, (sum, d) => sum + d.minutesWatched);
}

@riverpod
int weekTotalMinutes(WeekTotalMinutesRef ref) {
  final progress = ref.watch(userProgressProvider);
  return progress.weeklyActivity.fold(0, (sum, d) => sum + d.minutesWatched);
}

@riverpod
String formattedTotalTime(FormattedTotalTimeRef ref) {
  final progress = ref.watch(userProgressProvider);
  final minutes = progress.totalImmersionMinutes;
  final hours = minutes ~/ 60;
  final remaining = minutes % 60;
  if (remaining == 0) return '${hours}h';
  return '${hours}h ${remaining}m';
}

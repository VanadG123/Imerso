import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';

@freezed
class Achievement with _$Achievement {
  const factory Achievement({
    required String id,
    required String emoji,
    required String name,
    required String description,
    required bool isEarned,
    DateTime? earnedAt,
  }) = _Achievement;
}

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    required String displayName,
    required String handle,
    required String avatarUrl,
    required String nativeLanguage,
    required String targetLanguage,
    required String currentLevel,
    required double levelProgressPercent,
    required int totalVideosWatched,
    required int totalWordsLearned,
    required int currentStreakDays,
    required List<Achievement> achievements,
    required List<String> savedVideoThumbnails,
  }) = _UserProfile;
}

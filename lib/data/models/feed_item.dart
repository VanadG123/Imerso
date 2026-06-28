import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_item.freezed.dart';
part 'feed_item.g.dart';

@freezed
class SubtitleSegment with _$SubtitleSegment {
  const factory SubtitleSegment({
    required String id,
    required String text,
    required String translationText,
    required double startSeconds,
    @Default([]) List<String> highlightedWordIds,
  }) = _SubtitleSegment;

  factory SubtitleSegment.fromJson(Map<String, dynamic> json) =>
      _$SubtitleSegmentFromJson(json);
}

@freezed
class VocabWord with _$VocabWord {
  const factory VocabWord({
    required String id,
    required String word,
    required String reading,
    required String meaning,
    required String partOfSpeech,
    required String exampleSentence,
    required String difficultyLevel,
    @Default(false) bool isSaved,
  }) = _VocabWord;

  factory VocabWord.fromJson(Map<String, dynamic> json) =>
      _$VocabWordFromJson(json);
}

@freezed
class FeedItem with _$FeedItem {
  const factory FeedItem({
    required String id,
    required String creatorName,
    required String creatorHandle,
    required String creatorAvatarUrl,
    required String thumbnailUrl,
    required String videoTitle,
    required String targetLanguage,
    required String nativeLanguageTranslation,
    required String difficultyLevel,
    required int durationSeconds,
    @Default([]) List<SubtitleSegment> subtitleSegments,
    @Default([]) List<String> tags,
    @Default(0) int likesCount,
    @Default(0) int commentsCount,
    @Default(false) bool isLiked,
    @Default(false) bool isSaved,
    @Default(0) int viewCount,
  }) = _FeedItem;

  factory FeedItem.fromJson(Map<String, dynamic> json) =>
      _$FeedItemFromJson(json);
}

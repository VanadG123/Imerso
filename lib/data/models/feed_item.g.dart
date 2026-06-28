// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubtitleSegmentImpl _$$SubtitleSegmentImplFromJson(
        Map<String, dynamic> json) =>
    _$SubtitleSegmentImpl(
      id: json['id'] as String,
      text: json['text'] as String,
      translationText: json['translationText'] as String,
      startSeconds: (json['startSeconds'] as num).toDouble(),
      highlightedWordIds: (json['highlightedWordIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SubtitleSegmentImplToJson(
        _$SubtitleSegmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'translationText': instance.translationText,
      'startSeconds': instance.startSeconds,
      'highlightedWordIds': instance.highlightedWordIds,
    };

_$VocabWordImpl _$$VocabWordImplFromJson(Map<String, dynamic> json) =>
    _$VocabWordImpl(
      id: json['id'] as String,
      word: json['word'] as String,
      reading: json['reading'] as String,
      meaning: json['meaning'] as String,
      partOfSpeech: json['partOfSpeech'] as String,
      exampleSentence: json['exampleSentence'] as String,
      difficultyLevel: json['difficultyLevel'] as String,
      isSaved: json['isSaved'] as bool? ?? false,
    );

Map<String, dynamic> _$$VocabWordImplToJson(_$VocabWordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'word': instance.word,
      'reading': instance.reading,
      'meaning': instance.meaning,
      'partOfSpeech': instance.partOfSpeech,
      'exampleSentence': instance.exampleSentence,
      'difficultyLevel': instance.difficultyLevel,
      'isSaved': instance.isSaved,
    };

_$FeedItemImpl _$$FeedItemImplFromJson(Map<String, dynamic> json) =>
    _$FeedItemImpl(
      id: json['id'] as String,
      creatorName: json['creatorName'] as String,
      creatorHandle: json['creatorHandle'] as String,
      creatorAvatarUrl: json['creatorAvatarUrl'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      videoTitle: json['videoTitle'] as String,
      targetLanguage: json['targetLanguage'] as String,
      nativeLanguageTranslation: json['nativeLanguageTranslation'] as String,
      difficultyLevel: json['difficultyLevel'] as String,
      durationSeconds: (json['durationSeconds'] as num).toInt(),
      subtitleSegments: (json['subtitleSegments'] as List<dynamic>?)
              ?.map((e) => SubtitleSegment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      likesCount: (json['likesCount'] as num?)?.toInt() ?? 0,
      commentsCount: (json['commentsCount'] as num?)?.toInt() ?? 0,
      isLiked: json['isLiked'] as bool? ?? false,
      isSaved: json['isSaved'] as bool? ?? false,
      viewCount: (json['viewCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$FeedItemImplToJson(_$FeedItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creatorName': instance.creatorName,
      'creatorHandle': instance.creatorHandle,
      'creatorAvatarUrl': instance.creatorAvatarUrl,
      'thumbnailUrl': instance.thumbnailUrl,
      'videoTitle': instance.videoTitle,
      'targetLanguage': instance.targetLanguage,
      'nativeLanguageTranslation': instance.nativeLanguageTranslation,
      'difficultyLevel': instance.difficultyLevel,
      'durationSeconds': instance.durationSeconds,
      'subtitleSegments': instance.subtitleSegments,
      'tags': instance.tags,
      'likesCount': instance.likesCount,
      'commentsCount': instance.commentsCount,
      'isLiked': instance.isLiked,
      'isSaved': instance.isSaved,
      'viewCount': instance.viewCount,
    };

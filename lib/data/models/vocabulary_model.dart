import 'package:freezed_annotation/freezed_annotation.dart';
import 'feed_item.dart';

part 'vocabulary_model.freezed.dart';

enum WordSortOrder {
  savedDate,
  alphabetical,
  reviewCount,
  mastered,
}

@freezed
class SavedWord with _$SavedWord {
  const factory SavedWord({
    required VocabWord word,
    required DateTime savedAt,
    required String sourceLanguage,
    @Default(0) int reviewCount,
    @Default(false) bool isMastered,
    @Default([]) List<String> tags,
  }) = _SavedWord;
}

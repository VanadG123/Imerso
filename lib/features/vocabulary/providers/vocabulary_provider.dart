import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/mock/mock_vocabulary.dart';
import '../../../data/models/feed_item.dart';
import '../../../data/models/vocabulary_model.dart';

part 'vocabulary_provider.g.dart';

// ── State ────────────────────────────────────────────────────────────────────

class VocabularyState {
  final List<SavedWord> savedWords;
  final String searchQuery;
  final String? activeLanguageFilter;
  final String? activePosFilter;
  final WordSortOrder sortBy;

  const VocabularyState({
    required this.savedWords,
    this.searchQuery = '',
    this.activeLanguageFilter,
    this.activePosFilter,
    this.sortBy = WordSortOrder.savedDate,
  });

  VocabularyState copyWith({
    List<SavedWord>? savedWords,
    String? searchQuery,
    Object? activeLanguageFilter = _sentinel,
    Object? activePosFilter = _sentinel,
    WordSortOrder? sortBy,
  }) =>
      VocabularyState(
        savedWords: savedWords ?? this.savedWords,
        searchQuery: searchQuery ?? this.searchQuery,
        activeLanguageFilter: activeLanguageFilter == _sentinel
            ? this.activeLanguageFilter
            : activeLanguageFilter as String?,
        activePosFilter: activePosFilter == _sentinel
            ? this.activePosFilter
            : activePosFilter as String?,
        sortBy: sortBy ?? this.sortBy,
      );
}

const _sentinel = Object();

// ── Notifier ─────────────────────────────────────────────────────────────────

@riverpod
class VocabularyNotifier extends _$VocabularyNotifier {
  @override
  VocabularyState build() => VocabularyState(savedWords: List.of(mockSavedWords));

  // ── Computed getters ────────────────────────────────────────────────────────

  List<SavedWord> get filteredWords {
    var words = state.savedWords.toList();

    if (state.activeLanguageFilter != null) {
      words = words
          .where((w) => w.sourceLanguage == state.activeLanguageFilter)
          .toList();
    }

    if (state.activePosFilter != null) {
      words = words
          .where((w) => w.word.partOfSpeech.contains(state.activePosFilter!))
          .toList();
    }

    if (state.searchQuery.isNotEmpty) {
      final q = state.searchQuery.toLowerCase();
      words = words
          .where((w) =>
              w.word.word.toLowerCase().contains(q) ||
              w.word.reading.toLowerCase().contains(q) ||
              w.word.meaning.toLowerCase().contains(q))
          .toList();
    }

    switch (state.sortBy) {
      case WordSortOrder.savedDate:
        words.sort((a, b) => b.savedAt.compareTo(a.savedAt));
      case WordSortOrder.alphabetical:
        words.sort((a, b) => a.word.word.compareTo(b.word.word));
      case WordSortOrder.reviewCount:
        words.sort((a, b) => b.reviewCount.compareTo(a.reviewCount));
      case WordSortOrder.mastered:
        words.sort((a, b) =>
            (b.isMastered ? 1 : 0).compareTo(a.isMastered ? 1 : 0));
    }

    return words;
  }

  int get totalCount => state.savedWords.length;

  int get masteredCount => state.savedWords.where((w) => w.isMastered).length;

  int get thisWeekCount {
    final weekAgo = DateTime.now().subtract(const Duration(days: 7));
    return state.savedWords.where((w) => w.savedAt.isAfter(weekAgo)).length;
  }

  // ── Mutators ────────────────────────────────────────────────────────────────

  void saveWord(VocabWord word, String sourceLanguage) {
    final alreadySaved = state.savedWords.any((w) => w.word.id == word.id);
    if (alreadySaved) return;
    final newWord = SavedWord(
      word: word,
      savedAt: DateTime.now(),
      sourceLanguage: sourceLanguage,
    );
    state = state.copyWith(savedWords: [...state.savedWords, newWord]);
  }

  void removeWord(String wordId) {
    state = state.copyWith(
      savedWords: state.savedWords.where((w) => w.word.id != wordId).toList(),
    );
  }

  void toggleMastered(String wordId) {
    state = state.copyWith(
      savedWords: [
        for (final w in state.savedWords)
          if (w.word.id == wordId) w.copyWith(isMastered: !w.isMastered) else w,
      ],
    );
  }

  void updateSearch(String query) {
    state = state.copyWith(searchQuery: query);
  }

  void setLanguageFilter(String? language) {
    state = state.copyWith(activeLanguageFilter: language);
  }

  void setPosFilter(String? pos) {
    state = state.copyWith(activePosFilter: pos);
  }

  void setSortOrder(WordSortOrder order) {
    state = state.copyWith(sortBy: order);
  }

  // ── Initialisation ──────────────────────────────────────────────────────────

  /// Reads the user's target language from SharedPreferences and pre-selects
  /// that language filter. Called once from the vocabulary screen's initState.
  Future<void> initializeFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString('target_language');
    if (code == null || code.isEmpty) return;
    final name = _codeToName(code);
    if (name != null) {
      state = state.copyWith(activeLanguageFilter: name);
    }
  }

  static String? _codeToName(String code) => switch (code) {
        'ja' => 'Japanese',
        'es' => 'Spanish',
        'ko' => 'Korean',
        'fr' => 'French',
        'de' => 'German',
        'it' => 'Italian',
        'pt' => 'Portuguese',
        'zh' => 'Mandarin',
        'ru' => 'Russian',
        'ar' => 'Arabic',
        'hi' => 'Hindi',
        _ => null,
      };

  // ── Helpers ─────────────────────────────────────────────────────────────────

  bool isWordSaved(String wordId) {
    return state.savedWords.any((w) => w.word.id == wordId);
  }
}

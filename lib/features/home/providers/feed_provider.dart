import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/mock/mock_feed_data.dart';
import '../../../data/models/feed_item.dart';

part 'feed_provider.g.dart';

// ── Language filter ───────────────────────────────────────────────────────────

@riverpod
class FeedLanguageFilter extends _$FeedLanguageFilter {
  @override
  String build() => 'All';

  void set(String language) => state = language;
}

// ── Feed notifier ─────────────────────────────────────────────────────────────

@riverpod
class FeedNotifier extends _$FeedNotifier {
  @override
  List<FeedItem> build() => List.of(mockFeedItems);

  // Appends more items for fake infinite scroll (cycles through mock list).
  void appendMore() {
    final current = state;
    final extras = mockFeedItems
        .take(3)
        .map((item) => item.copyWith(id: '${item.id}_${current.length}'))
        .toList();
    state = [...current, ...extras];
  }

  void toggleLike(String id) {
    state = [
      for (final item in state)
        if (item.id == id)
          item.copyWith(
            isLiked: !item.isLiked,
            likesCount: item.isLiked ? item.likesCount - 1 : item.likesCount + 1,
          )
        else
          item,
    ];
  }

  void toggleSave(String id) {
    state = [
      for (final item in state)
        if (item.id == id)
          item.copyWith(isSaved: !item.isSaved)
        else
          item,
    ];
  }
}

// ── Filtered feed (derived) ───────────────────────────────────────────────────

@riverpod
List<FeedItem> filteredFeed(FilteredFeedRef ref) {
  final all = ref.watch(feedNotifierProvider);
  final filter = ref.watch(feedLanguageFilterProvider);
  if (filter == 'All') return all;
  return all.where((i) => i.targetLanguage == filter).toList();
}

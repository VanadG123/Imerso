import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/router/app_router.dart';
import '../../../core/widgets/app_empty_state.dart';
import '../../../data/models/vocabulary_model.dart';
import '../providers/vocabulary_provider.dart';
import '../widgets/stat_mini_card.dart';
import '../widgets/word_card.dart';

// ── Vocabulary screen ─────────────────────────────────────────────────────────

class VocabularyScreen extends ConsumerStatefulWidget {
  const VocabularyScreen({super.key});

  @override
  ConsumerState<VocabularyScreen> createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends ConsumerState<VocabularyScreen> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vocabState = ref.watch(vocabularyNotifierProvider);
    final notifier = ref.read(vocabularyNotifierProvider.notifier);
    final filtered = notifier.filteredWords;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // ── App bar + search ───────────────────────────────────────────────
          SliverAppBar(
            pinned: true,
            backgroundColor: AppColors.background,
            surfaceTintColor: Colors.transparent,
            title: Text('My Vocabulary', style: AppTextStyles.headingLarge),
            actions: [
              IconButton(
                icon: const Icon(Icons.sort_rounded,
                    color: AppColors.onSurface),
                tooltip: 'Sort',
                onPressed: () => _showSortSheet(context, vocabState, notifier),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.md,
                  0,
                  AppSpacing.md,
                  AppSpacing.sm,
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: notifier.updateSearch,
                  style: AppTextStyles.bodyMedium,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFF1E1E2A),
                    hintText: 'Search words…',
                    hintStyle: AppTextStyles.bodyMedium
                        .copyWith(color: AppColors.onSurfaceMuted),
                    prefixIcon: const Icon(Icons.search_rounded,
                        color: AppColors.onSurfaceMuted),
                    suffixIcon: vocabState.searchQuery.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.close_rounded,
                                color: AppColors.onSurfaceMuted, size: 18),
                            onPressed: () {
                              _searchController.clear();
                              notifier.updateSearch('');
                            },
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ),
          ),

          // ── Filter chips ───────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: _FilterChipsRow(
              vocabState: vocabState,
              notifier: notifier,
            ),
          ),

          // ── Stats row ──────────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                AppSpacing.sm,
                AppSpacing.md,
                AppSpacing.md,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: StatMiniCard(
                      value: notifier.totalCount,
                      label: 'Total',
                      icon: Icons.bookmark_rounded,
                      color: AppColors.secondary,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: StatMiniCard(
                      value: notifier.masteredCount,
                      label: 'Mastered',
                      icon: Icons.star_rounded,
                      color: AppColors.warning,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: StatMiniCard(
                      value: notifier.thisWeekCount,
                      label: 'This week',
                      icon: Icons.trending_up_rounded,
                      color: AppColors.success,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Word list ──────────────────────────────────────────────────────
          if (filtered.isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,
              child: AppEmptyState(
                icon: Icons.menu_book_outlined,
                title: vocabState.searchQuery.isNotEmpty
                    ? 'No words match "${vocabState.searchQuery}"'
                    : 'No words saved yet',
                subtitle: vocabState.searchQuery.isNotEmpty
                    ? 'Try a different search term'
                    : 'Tap highlighted words in the feed to save them here',
              ),
            )
          else
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final savedWord = filtered[index];
                  return Dismissible(
                    key: ValueKey(savedWord.word.id),
                    direction: DismissDirection.endToStart,
                    background: _SwipeDeleteBackground(),
                    confirmDismiss: (_) => _confirmDismiss(context),
                    onDismissed: (_) =>
                        ref
                            .read(vocabularyNotifierProvider.notifier)
                            .removeWord(savedWord.word.id),
                    child: WordCard(
                      savedWord: savedWord,
                      onTap: () => context.push(
                        AppRoutes.wordDetailPath(savedWord.word.id),
                      ),
                    ),
                  );
                },
                childCount: filtered.length,
              ),
            ),

          const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xl)),
        ],
      ),
    );
  }

  Future<bool> _confirmDismiss(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('Remove this word?', style: AppTextStyles.headingSmall),
        content: Text(
          'This word will be removed from your vocabulary list.',
          style: AppTextStyles.bodyMedium
              .copyWith(color: AppColors.onSurfaceMuted),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text(
              'Remove',
              style: TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  void _showSortSheet(
    BuildContext context,
    VocabularyState state,
    VocabularyNotifier notifier,
  ) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => _SortBottomSheet(
        current: state.sortBy,
        onSelect: (order) {
          notifier.setSortOrder(order);
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

// ── Filter chips row ──────────────────────────────────────────────────────────

class _FilterChipsRow extends StatelessWidget {
  const _FilterChipsRow({
    required this.vocabState,
    required this.notifier,
  });

  final VocabularyState vocabState;
  final VocabularyNotifier notifier;

  bool _isActive(String label) {
    return switch (label) {
      'All' =>
        vocabState.activeLanguageFilter == null &&
            vocabState.activePosFilter == null,
      'Japanese' || 'Spanish' || 'Korean' =>
        vocabState.activeLanguageFilter == label,
      'Nouns' => vocabState.activePosFilter == 'noun',
      'Verbs' => vocabState.activePosFilter == 'verb',
      'Adjectives' => vocabState.activePosFilter == 'adjective',
      'Phrases' => vocabState.activePosFilter == 'phrase',
      _ => false,
    };
  }

  void _onChipTap(String label) {
    switch (label) {
      case 'All':
        notifier.setLanguageFilter(null);
        notifier.setPosFilter(null);
      case 'Japanese' || 'Spanish' || 'Korean':
        notifier.setLanguageFilter(label);
        notifier.setPosFilter(null);
      case 'Nouns':
        notifier.setPosFilter('noun');
        notifier.setLanguageFilter(null);
      case 'Verbs':
        notifier.setPosFilter('verb');
        notifier.setLanguageFilter(null);
      case 'Adjectives':
        notifier.setPosFilter('adjective');
        notifier.setLanguageFilter(null);
      case 'Phrases':
        notifier.setPosFilter('phrase');
        notifier.setLanguageFilter(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    const chips = [
      'All',
      'Japanese',
      'Spanish',
      'Korean',
      'Nouns',
      'Verbs',
      'Adjectives',
      'Phrases',
    ];

    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        itemCount: chips.length,
        separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.xs),
        itemBuilder: (context, index) {
          final label = chips[index];
          final active = _isActive(label);
          return GestureDetector(
            onTap: () => _onChipTap(label),
            child: Chip(
              label: Text(
                label,
                style: AppTextStyles.labelMedium.copyWith(
                  color:
                      active ? Colors.white : AppColors.onSurfaceMuted,
                ),
              ),
              backgroundColor: active
                  ? AppColors.primary
                  : const Color(0xFF1E1E2A),
              shape: const StadiumBorder(),
              side: BorderSide.none,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          );
        },
      ),
    );
  }
}

// ── Swipe delete background ───────────────────────────────────────────────────

class _SwipeDeleteBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md, vertical: AppSpacing.xs),
      decoration: BoxDecoration(
        color: AppColors.error.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.error.withValues(alpha: 0.4)),
      ),
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: AppSpacing.lg),
      child: const Icon(Icons.delete_outline_rounded,
          color: AppColors.error, size: 24),
    );
  }
}

// ── Sort bottom sheet ─────────────────────────────────────────────────────────

class _SortBottomSheet extends StatelessWidget {
  const _SortBottomSheet({
    required this.current,
    required this.onSelect,
  });

  final WordSortOrder current;
  final void Function(WordSortOrder) onSelect;

  @override
  Widget build(BuildContext context) {
    const options = [
      (label: 'Date saved', order: WordSortOrder.savedDate),
      (label: 'Alphabetical', order: WordSortOrder.alphabetical),
      (label: 'Most reviewed', order: WordSortOrder.reviewCount),
      (label: 'Mastered first', order: WordSortOrder.mastered),
    ];

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.fromLTRB(
          AppSpacing.lg, AppSpacing.md, AppSpacing.lg, AppSpacing.xl),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text('Sort by', style: AppTextStyles.headingSmall),
          const SizedBox(height: AppSpacing.sm),
          ...options.map((o) => ListTile(
                title: Text(o.label, style: AppTextStyles.bodyMedium),
                trailing: current == o.order
                    ? const Icon(Icons.check_rounded,
                        color: AppColors.primary)
                    : null,
                contentPadding: EdgeInsets.zero,
                onTap: () => onSelect(o.order),
              )),
        ],
      ),
    );
  }
}

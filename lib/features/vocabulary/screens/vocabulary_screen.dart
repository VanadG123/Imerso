import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/router/app_router.dart';
import '../../../core/widgets/app_empty_state.dart';
import '../../../core/widgets/app_shimmer.dart';
import '../../../data/models/vocabulary_model.dart';
import '../providers/vocabulary_provider.dart';
import '../widgets/word_card.dart';

// ── Flag helper ───────────────────────────────────────────────────────────────

String _flagForLanguage(String lang) => switch (lang) {
      'Japanese' => '🇯🇵',
      'Spanish' => '🇪🇸',
      'Korean' => '🇰🇷',
      'French' => '🇫🇷',
      'German' => '🇩🇪',
      'Italian' => '🇮🇹',
      'Portuguese' => '🇵🇹',
      'Mandarin' => '🇨🇳',
      'Russian' => '🇷🇺',
      'Arabic' => '🇸🇦',
      'Hindi' => '🇮🇳',
      _ => '🌐',
    };

// ── Vocabulary screen ─────────────────────────────────────────────────────────

class VocabularyScreen extends ConsumerStatefulWidget {
  const VocabularyScreen({super.key});

  @override
  ConsumerState<VocabularyScreen> createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends ConsumerState<VocabularyScreen> {
  final _searchController = TextEditingController();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(vocabularyNotifierProvider.notifier)
          .initializeFromPrefs()
          .then((_) {
        if (mounted) setState(() => _loading = false);
      });
    });
  }

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

    // Derive distinct languages from saved words preserving insertion order.
    final languageSet = <String>{};
    for (final w in vocabState.savedWords) {
      languageSet.add(w.sourceLanguage);
    }
    final languages = ['All', ...languageSet];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // ── App bar + search ───────────────────────────────────────────────
          SliverAppBar(
            pinned: true,
            backgroundColor: AppColors.background,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            title: Text('Vocabulary', style: AppTextStyles.headingLarge),
            actions: [
              IconButton(
                icon: const Icon(Icons.tune_rounded, color: AppColors.onSurface),
                onPressed: () =>
                    _showSortSheet(context, vocabState, notifier),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(56),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                child: TextField(
                  controller: _searchController,
                  onChanged: notifier.updateSearch,
                  style: AppTextStyles.bodyMedium,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFF1E1E2A),
                    hintText: 'Search words...',
                    hintStyle: AppTextStyles.bodyMedium
                        .copyWith(color: AppColors.onSurfaceMuted),
                    prefixIcon: const Icon(Icons.search_rounded,
                        color: AppColors.onSurfaceMuted, size: 20),
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
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ),
          ),

          if (_loading)
            // ── Shimmer while prefs load ─────────────────────────────────────
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, __) => const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 16, vertical: 6),
                  child: AppShimmer(
                    height: 80,
                    width: double.infinity,
                    borderRadius: 12,
                  ),
                ),
                childCount: 6,
              ),
            )
          else ...[
            // ── Language filter ──────────────────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'LANGUAGE',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.onSurfaceMuted,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (int i = 0; i < languages.length; i++) ...[
                            if (i > 0) const SizedBox(width: 8),
                            _LanguageChip(
                              label: languages[i],
                              flag: _flagForLanguage(languages[i]),
                              isSelected: languages[i] == 'All'
                                  ? vocabState.activeLanguageFilter == null
                                  : vocabState.activeLanguageFilter ==
                                      languages[i],
                              onTap: () => notifier.setLanguageFilter(
                                  languages[i] == 'All' ? null : languages[i]),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ── Word type filter ─────────────────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'WORD TYPE',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.onSurfaceMuted,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _TypeChip(
                          label: 'All types',
                          isSelected: vocabState.activePosFilter == null,
                          onTap: () => notifier.setPosFilter(null),
                        ),
                        _TypeChip(
                          label: 'Nouns',
                          isSelected: vocabState.activePosFilter == 'noun',
                          onTap: () => notifier.setPosFilter('noun'),
                        ),
                        _TypeChip(
                          label: 'Verbs',
                          isSelected: vocabState.activePosFilter == 'verb',
                          onTap: () => notifier.setPosFilter('verb'),
                        ),
                        _TypeChip(
                          label: 'Adjectives',
                          isSelected:
                              vocabState.activePosFilter == 'adjective',
                          onTap: () => notifier.setPosFilter('adjective'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // ── Stats row ────────────────────────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                child: Row(
                  children: [
                    _InlineStat(
                      icon: Icons.bookmark_rounded,
                      iconColor: AppColors.secondary,
                      value: notifier.totalCount,
                      label: 'Total',
                    ),
                    const SizedBox(width: 8),
                    _InlineStat(
                      icon: Icons.star_rounded,
                      iconColor: AppColors.warning,
                      value: notifier.masteredCount,
                      label: 'Mastered',
                    ),
                    const SizedBox(width: 8),
                    _InlineStat(
                      icon: Icons.local_fire_department_rounded,
                      iconColor: AppColors.accent,
                      value: notifier.thisWeekCount,
                      label: 'This week',
                    ),
                  ],
                ),
              ),
            ),

            // ── Results count ────────────────────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  filtered.isEmpty
                      ? 'No words found'
                      : '${filtered.length} word${filtered.length == 1 ? '' : 's'}',
                  style: AppTextStyles.caption
                      .copyWith(color: AppColors.onSurfaceMuted),
                ),
              ),
            ),

            // ── Word list or empty state ──────────────────────────────────────
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
                      background: const _SwipeDeleteBackground(),
                      confirmDismiss: (_) => _confirmDismiss(context),
                      onDismissed: (_) => ref
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

            const SliverToBoxAdapter(
                child: SizedBox(height: AppSpacing.xl)),
          ],
        ],
      ),
    );
  }

  Future<bool> _confirmDismiss(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
            child: const Text('Remove',
                style: TextStyle(color: AppColors.error)),
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

// ── Language chip ─────────────────────────────────────────────────────────────

class _LanguageChip extends StatelessWidget {
  const _LanguageChip({
    required this.label,
    required this.flag,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final String flag;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary
              : const Color(0xFF1E1E2A),
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : Colors.white.withValues(alpha: 0.06),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(flag, style: const TextStyle(fontSize: 16)),
            const SizedBox(width: 6),
            Text(
              label,
              style: AppTextStyles.labelMedium.copyWith(
                color:
                    isSelected ? Colors.white : AppColors.onSurfaceMuted,
                fontWeight:
                    isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Type chip ─────────────────────────────────────────────────────────────────

class _TypeChip extends StatelessWidget {
  const _TypeChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withValues(alpha: 0.15)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.border,
          ),
        ),
        child: Text(
          label,
          style: AppTextStyles.labelMedium.copyWith(
            color: isSelected
                ? AppColors.primaryLight
                : AppColors.onSurfaceMuted,
            fontWeight:
                isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

// ── Inline stat ───────────────────────────────────────────────────────────────

class _InlineStat extends StatelessWidget {
  const _InlineStat({
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final Color iconColor;
  final int value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, size: 16, color: iconColor),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  value.toString(),
                  style: AppTextStyles.headingSmall
                      .copyWith(color: Colors.white),
                ),
                Text(label, style: AppTextStyles.caption),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ── Swipe delete background ───────────────────────────────────────────────────

class _SwipeDeleteBackground extends StatelessWidget {
  const _SwipeDeleteBackground();

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
          ...options.map(
            (o) => ListTile(
              title: Text(o.label, style: AppTextStyles.bodyMedium),
              trailing: current == o.order
                  ? const Icon(Icons.check_rounded, color: AppColors.primary)
                  : null,
              contentPadding: EdgeInsets.zero,
              onTap: () => onSelect(o.order),
            ),
          ),
        ],
      ),
    );
  }
}

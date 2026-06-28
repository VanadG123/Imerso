import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/widgets/app_badge.dart';
import '../../../core/widgets/app_empty_state.dart';
import '../providers/vocabulary_provider.dart';
import '../widgets/word_mini_card.dart';

class WordDetailScreen extends ConsumerWidget {
  const WordDetailScreen({super.key, required this.wordId});

  final String wordId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vocabState = ref.watch(vocabularyNotifierProvider);
    final notifier = ref.read(vocabularyNotifierProvider.notifier);

    final savedWord = vocabState.savedWords
        .where((w) => w.word.id == wordId)
        .firstOrNull;

    if (savedWord == null) {
      return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: const AppEmptyState(
          icon: Icons.search_off_rounded,
          title: 'Word not found',
          subtitle: 'This word is not in your vocabulary list.',
        ),
      );
    }

    final word = savedWord.word;
    final showReading = word.reading != word.word;

    final relatedWords = vocabState.savedWords
        .where(
          (w) =>
              w.sourceLanguage == savedWord.sourceLanguage &&
              w.word.id != wordId,
        )
        .take(3)
        .toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // ── App bar ──────────────────────────────────────────────────────
          SliverAppBar(
            pinned: true,
            backgroundColor: AppColors.background,
            surfaceTintColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  savedWord.isMastered
                      ? Icons.star_rounded
                      : Icons.star_outline_rounded,
                  color: savedWord.isMastered
                      ? AppColors.warning
                      : AppColors.onSurface,
                ),
                onPressed: () => notifier.toggleMastered(wordId),
              ),
              IconButton(
                icon: const Icon(
                  Icons.delete_outline_rounded,
                  color: AppColors.error,
                ),
                onPressed: () => _confirmRemove(context, ref),
              ),
            ],
          ),

          // ── Hero section ─────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppBadge(
                        label: savedWord.sourceLanguage,
                        color: _langColor(savedWord.sourceLanguage),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      AppBadge(
                        label: word.difficultyLevel,
                        color: AppColors.primaryLight,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    word.word,
                    style: AppTextStyles.displayLarge
                        .copyWith(color: AppColors.primaryLight),
                    textAlign: TextAlign.center,
                  ),
                  if (showReading) ...[
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      word.reading,
                      style: AppTextStyles.headingMedium
                          .copyWith(color: AppColors.onSurfaceMuted),
                      textAlign: TextAlign.center,
                    ),
                  ],
                  const SizedBox(height: AppSpacing.sm),
                  Chip(
                    label: Text(word.partOfSpeech),
                    backgroundColor: const Color(0xFF1E1E2A),
                    labelStyle: AppTextStyles.labelMedium
                        .copyWith(color: AppColors.onSurfaceMuted),
                    shape: const StadiumBorder(),
                    side: BorderSide.none,
                  ),
                  const SizedBox(height: AppSpacing.xl),
                ],
              ),
            ),
          ),

          // ── Info cards ────────────────────────────────────────────────────
          SliverList(
            delegate: SliverChildListDelegate([
              _InfoCard(
                label: 'MEANING',
                accentColor: AppColors.primary,
                child: Text(word.meaning, style: AppTextStyles.bodyLarge),
              ),
              _InfoCard(
                label: 'EXAMPLE',
                accentColor: AppColors.secondary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      word.exampleSentence,
                      style: AppTextStyles.bodyLarge
                          .copyWith(fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      'Translation: "${word.exampleSentence} (translation)"',
                      style: AppTextStyles.bodySmall
                          .copyWith(color: AppColors.onSurfaceMuted),
                    ),
                  ],
                ),
              ),
              _InfoCard(
                label: 'NOTES',
                accentColor: AppColors.accent,
                child: Text(
                  _usageNote(word.partOfSpeech),
                  style: AppTextStyles.bodyMedium
                      .copyWith(color: AppColors.onSurfaceMuted),
                ),
              ),
            ]),
          ),

          // ── Actions ───────────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: AppSpacing.md),
                  OutlinedButton.icon(
                    icon: Icon(
                      savedWord.isMastered
                          ? Icons.star_rounded
                          : Icons.star_outline_rounded,
                    ),
                    label: Text(
                      savedWord.isMastered ? 'Mastered ✓' : 'Mark as Mastered',
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: savedWord.isMastered
                          ? AppColors.warning
                          : AppColors.onSurface,
                      side: BorderSide(
                        color: savedWord.isMastered
                            ? AppColors.warning
                            : AppColors.border,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    onPressed: () => notifier.toggleMastered(wordId),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  TextButton(
                    onPressed: () => _confirmRemove(context, ref),
                    child: const Text(
                      'Remove from Vocabulary',
                      style: TextStyle(color: AppColors.error),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Related words ─────────────────────────────────────────────────
          if (relatedWords.isNotEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('You might also like',
                        style: AppTextStyles.headingSmall),
                    const SizedBox(height: AppSpacing.sm),
                    SizedBox(
                      height: 110,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: relatedWords.length,
                        separatorBuilder: (_, __) =>
                            const SizedBox(width: AppSpacing.sm),
                        itemBuilder: (context, index) =>
                            WordMiniCard(savedWord: relatedWords[index]),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xl)),
        ],
      ),
    );
  }

  Color _langColor(String language) => switch (language) {
        'Japanese' => AppColors.primary,
        'Spanish' => AppColors.accent,
        _ => AppColors.secondary,
      };

  String _usageNote(String pos) => switch (pos) {
        'noun' => 'Used with の particle to show possession in Japanese.',
        'verb' => 'Conjugates with ます ending in polite form.',
        'adjective' =>
          'い-adjectives change to くない in negative form.',
        'phrase' => 'Common in casual conversation.',
        _ =>
          'Practice using this word in example sentences.',
      };

  Future<void> _confirmRemove(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title:
            Text('Remove this word?', style: AppTextStyles.headingSmall),
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
    if (confirmed == true && context.mounted) {
      ref.read(vocabularyNotifierProvider.notifier).removeWord(wordId);
      Navigator.of(context).pop();
    }
  }
}

// ── Info card ─────────────────────────────────────────────────────────────────

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.label,
    required this.accentColor,
    required this.child,
  });

  final String label;
  final Color accentColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border(
          left: BorderSide(color: accentColor, width: 3),
        ),
      ),
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyles.caption.copyWith(
              letterSpacing: 1.2,
              color: AppColors.onSurfaceMuted,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          child,
        ],
      ),
    );
  }
}

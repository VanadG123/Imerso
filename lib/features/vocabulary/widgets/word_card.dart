import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../data/models/vocabulary_model.dart';
import '../providers/vocabulary_provider.dart';

class WordCard extends ConsumerWidget {
  const WordCard({
    super.key,
    required this.savedWord,
    required this.onTap,
  });

  final SavedWord savedWord;
  final VoidCallback onTap;

  List<Color> _gradientForLanguage(String language) => switch (language) {
        'Japanese' => AppColors.gradientPrimary,
        'Spanish' => AppColors.gradientAccent,
        _ => [AppColors.secondary, AppColors.primary],
      };

  Color _colorForLanguage(String language) => switch (language) {
        'Japanese' => AppColors.primary,
        'Spanish' => AppColors.accent,
        _ => AppColors.secondary,
      };

  void _showContextMenu(
    BuildContext context,
    WidgetRef ref,
    Offset position,
  ) {
    final notifier = ref.read(vocabularyNotifierProvider.notifier);
    showMenu<String>(
      context: context,
      color: AppColors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy,
        position.dx,
        position.dy,
      ),
      items: [
        PopupMenuItem<String>(
          value: 'mastered',
          child: Text(
            savedWord.isMastered ? 'Mark as learning' : 'Mark as mastered',
            style: AppTextStyles.bodyMedium,
          ),
        ),
        PopupMenuItem<String>(
          value: 'remove',
          child: Text(
            'Remove word',
            style:
                AppTextStyles.bodyMedium.copyWith(color: AppColors.error),
          ),
        ),
      ],
    ).then((value) {
      if (value == 'mastered') {
        notifier.toggleMastered(savedWord.word.id);
      } else if (value == 'remove') {
        if (context.mounted) _confirmRemove(context, ref);
      }
    });
  }

  Future<void> _confirmRemove(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('Remove this word?', style: AppTextStyles.headingSmall),
        content: Text(
          'Remove "${savedWord.word.word}" from your vocabulary.',
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
    if (confirmed == true && context.mounted) {
      ref.read(vocabularyNotifierProvider.notifier).removeWord(savedWord.word.id);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(vocabularyNotifierProvider.notifier);
    final word = savedWord.word;
    final gradient = _gradientForLanguage(savedWord.sourceLanguage);
    final langColor = _colorForLanguage(savedWord.sourceLanguage);
    final showReading = word.reading != word.word;

    return GestureDetector(
      onLongPressStart: (d) => _showContextMenu(context, ref, d.globalPosition),
      child: Card(
        color: AppColors.card,
        margin: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              children: [
                // Leading avatar
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: gradient,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      word.word[0].toUpperCase(),
                      style: AppTextStyles.headingMedium
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),

                // Middle content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(
                            word.word,
                            style: AppTextStyles.labelLarge.copyWith(
                              color: AppColors.onSurface,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          if (showReading) ...[
                            Text(
                              '  ·  ',
                              style: AppTextStyles.bodySmall.copyWith(
                                  color: AppColors.onSurfaceMuted),
                            ),
                            Text(
                              word.reading,
                              style: AppTextStyles.bodySmall.copyWith(
                                  color: AppColors.onSurfaceMuted),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          _LanguageBadge(
                            label: savedWord.sourceLanguage,
                            color: langColor,
                          ),
                          const SizedBox(width: AppSpacing.xs),
                          _PosBadge(pos: word.partOfSpeech),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        word.meaning,
                        style: AppTextStyles.bodySmall
                            .copyWith(color: AppColors.onSurfaceMuted),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (savedWord.reviewCount > 0) ...[
                        const SizedBox(height: 2),
                        Text(
                          '${savedWord.reviewCount}×',
                          style: AppTextStyles.caption,
                        ),
                      ],
                    ],
                  ),
                ),

                // Trailing star
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        savedWord.isMastered
                            ? Icons.star_rounded
                            : Icons.star_outline_rounded,
                        color: savedWord.isMastered
                            ? AppColors.warning
                            : AppColors.onSurfaceMuted,
                      ),
                      iconSize: 22,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () =>
                          notifier.toggleMastered(word.id),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LanguageBadge extends StatelessWidget {
  const _LanguageBadge({required this.label, required this.color});
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Text(
        label,
        style: AppTextStyles.caption.copyWith(color: color),
      ),
    );
  }
}

class _PosBadge extends StatelessWidget {
  const _PosBadge({required this.pos});
  final String pos;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(
        pos,
        style: AppTextStyles.caption,
      ),
    );
  }
}

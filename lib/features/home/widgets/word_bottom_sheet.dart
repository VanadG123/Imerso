import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/widgets/app_button.dart';
import '../../../data/mock/mock_vocab_words.dart';
import '../../vocabulary/providers/vocabulary_provider.dart';

void showWordBottomSheet(
  BuildContext context,
  String wordKey, {
  String sourceLanguage = '',
}) {
  final lang = sourceLanguage.isNotEmpty
      ? sourceLanguage
      : _detectLanguage(wordKey);

  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _WordSheet(wordKey: wordKey, sourceLanguage: lang),
  );
}

String _detectLanguage(String wordKey) {
  for (final char in wordKey.runes) {
    if ((char >= 0x3040 && char <= 0x30FF) ||
        (char >= 0x4E00 && char <= 0x9FFF)) {
      return 'Japanese';
    }
    if (char >= 0xAC00 && char <= 0xD7AF) {
      return 'Korean';
    }
  }
  return 'Spanish';
}

class _WordSheet extends ConsumerWidget {
  const _WordSheet({
    required this.wordKey,
    required this.sourceLanguage,
  });

  final String wordKey;
  final String sourceLanguage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final word = mockVocabWords[wordKey];
    if (word == null) return const SizedBox.shrink();

    final isAlreadySaved = ref.watch(
      vocabularyNotifierProvider.select(
        (state) => state.savedWords.any((s) => s.word.id == word.id),
      ),
    );

    return DraggableScrollableSheet(
      initialChildSize: 0.40,
      minChildSize: 0.35,
      maxChildSize: 0.65,
      snap: true,
      snapSizes: const [0.40, 0.65],
      builder: (_, controller) => ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.card.withValues(alpha: 0.96),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              border: const Border(
                top: BorderSide(color: AppColors.border),
                left: BorderSide(color: AppColors.border),
                right: BorderSide(color: AppColors.border),
              ),
            ),
            child: ListView(
              controller: controller,
              padding: const EdgeInsets.fromLTRB(
                  AppSpacing.lg, AppSpacing.sm, AppSpacing.lg, AppSpacing.xxl),
              children: [
                // Drag handle
                Center(
                  child: Container(
                    width: 36,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: AppSpacing.md),
                    decoration: BoxDecoration(
                      color: AppColors.border,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                // Word
                Text(
                  word.word,
                  style: AppTextStyles.headingLarge
                      .copyWith(color: AppColors.primaryLight),
                ),
                const SizedBox(height: AppSpacing.xs),
                // Reading / pronunciation
                Text(
                  word.reading,
                  style: AppTextStyles.bodyMedium
                      .copyWith(color: AppColors.onSurfaceMuted),
                ),
                const SizedBox(height: AppSpacing.sm),
                // Part of speech chip
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.sm, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Text(word.partOfSpeech,
                        style: AppTextStyles.caption
                            .copyWith(color: AppColors.onSurfaceMuted)),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                // Meaning
                Text(word.meaning, style: AppTextStyles.bodyLarge),
                const SizedBox(height: AppSpacing.sm),
                // Example
                Text(
                  word.exampleSentence,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.onSurfaceMuted,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                // Save button
                if (isAlreadySaved)
                  const AppButton(
                    label: 'Saved ✓',
                    onTap: null,
                    leadingIcon: Icons.check_rounded,
                  )
                else
                  AppButton(
                    label: 'Save to Vocabulary',
                    onTap: () {
                      ref
                          .read(vocabularyNotifierProvider.notifier)
                          .saveWord(word, sourceLanguage);
                      HapticFeedback.lightImpact();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Saved to vocabulary!',
                            style: AppTextStyles.bodyMedium,
                          ),
                          backgroundColor: AppColors.surface,
                          duration: const Duration(milliseconds: 1500),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

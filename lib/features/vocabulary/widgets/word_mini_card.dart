import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/router/app_router.dart';
import '../../../data/models/vocabulary_model.dart';

class WordMiniCard extends StatelessWidget {
  const WordMiniCard({super.key, required this.savedWord});

  final SavedWord savedWord;

  @override
  Widget build(BuildContext context) {
    final word = savedWord.word;
    final showReading = word.reading != word.word;

    return GestureDetector(
      onTap: () => context.push(AppRoutes.wordDetailPath(word.id)),
      child: Container(
        width: 130,
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        padding: const EdgeInsets.all(AppSpacing.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              word.word,
              style: AppTextStyles.labelLarge
                  .copyWith(color: AppColors.primaryLight),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            if (showReading) ...[
              const SizedBox(height: 2),
              Text(
                word.reading,
                style: AppTextStyles.bodySmall
                    .copyWith(color: AppColors.onSurfaceMuted),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            const SizedBox(height: AppSpacing.xs),
            Text(
              word.meaning,
              style: AppTextStyles.bodySmall
                  .copyWith(color: AppColors.onSurfaceMuted),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

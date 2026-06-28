import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../data/models/profile_model.dart';

class AchievementCard extends StatelessWidget {
  const AchievementCard({super.key, required this.achievement});

  final Achievement achievement;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: achievement.isEarned
              ? AppColors.primary.withValues(alpha: 0.4)
              : AppColors.border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: achievement.isEarned
                      ? const LinearGradient(colors: AppColors.gradientPrimary)
                      : null,
                  color:
                      achievement.isEarned ? null : const Color(0xFF1E1E2A),
                ),
                child: Center(
                  child: Text(
                    achievement.emoji,
                    style: const TextStyle(fontSize: 26),
                  ),
                ),
              ),
              if (!achievement.isEarned)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withValues(alpha: 0.55),
                    ),
                    child: const Icon(
                      Icons.lock_rounded,
                      size: 18,
                      color: AppColors.onSurfaceMuted,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            achievement.name,
            style: AppTextStyles.labelMedium,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            achievement.isEarned ? 'Earned' : 'Locked',
            style: AppTextStyles.caption.copyWith(
              color: achievement.isEarned
                  ? AppColors.success
                  : AppColors.onSurfaceMuted,
            ),
          ),
        ],
      ),
    );
  }
}

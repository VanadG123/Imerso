import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class LevelProgressBar extends StatelessWidget {
  const LevelProgressBar({
    super.key,
    required this.currentLevel,
    required this.targetLevel,
    required this.percent,
  });

  final String currentLevel;
  final String targetLevel;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              currentLevel,
              style:
                  AppTextStyles.labelLarge.copyWith(color: AppColors.primaryLight),
            ),
            Text(
              '${(percent * 100).toInt()}% to $targetLevel',
              style: AppTextStyles.caption,
            ),
            Text(
              targetLevel,
              style: AppTextStyles.labelLarge
                  .copyWith(color: AppColors.onSurfaceMuted),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Stack(
          children: [
            // Track
            Container(
              height: 8,
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E2A),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            // Animated fill
            Container(
              height: 8,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: AppColors.gradientPrimary,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
            )
                .animate()
                .custom(
                  duration: const Duration(milliseconds: 1200),
                  curve: Curves.easeOutCubic,
                  builder: (context, value, child) => FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: percent * value,
                    child: child,
                  ),
                ),
          ],
        ),
      ],
    );
  }
}

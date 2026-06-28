import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_text_styles.dart';

class ActivityCalendar extends StatelessWidget {
  const ActivityCalendar({super.key, required this.monthlyMinutes});

  final List<int> monthlyMinutes;

  @override
  Widget build(BuildContext context) {
    // Last 28 days = indices 2–29
    final last28 = monthlyMinutes.sublist(
      monthlyMinutes.length >= 28 ? monthlyMinutes.length - 28 : 0,
    );

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // Day-of-week header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: ['M', 'T', 'W', 'T', 'F', 'S', 'S']
                .map(
                  (d) => SizedBox(
                    width: 28,
                    child: Text(
                      d,
                      style: AppTextStyles.caption,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 8),
          // 4×7 grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              childAspectRatio: 1,
            ),
            itemCount: last28.length,
            itemBuilder: (context, index) {
              final minutes = last28[index];
              final color = minutes == 0
                  ? const Color(0xFF1E1E2A)
                  : minutes <= 20
                      ? AppColors.primary.withValues(alpha: 0.25)
                      : minutes <= 40
                          ? AppColors.primary.withValues(alpha: 0.55)
                          : AppColors.primary;
              return Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            },
          ),
          const SizedBox(height: 8),
          // Legend
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Less', style: AppTextStyles.caption),
              const SizedBox(width: 8),
              ...const [0.25, 0.55, 1.0].map(
                (opacity) => Container(
                  width: 12,
                  height: 12,
                  margin: const EdgeInsets.only(right: 4),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(
                      124,
                      58,
                      237,
                      opacity,
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Text('More', style: AppTextStyles.caption),
            ],
          ),
        ],
      ),
    );
  }
}

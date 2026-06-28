import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../data/models/progress_model.dart';

class LanguagePieChart extends StatelessWidget {
  const LanguagePieChart({super.key, required this.stats});

  final List<LanguageStat> stats;

  @override
  Widget build(BuildContext context) {
    final total = stats.fold(0, (sum, s) => sum + s.minutesWatched);

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Pie chart
          SizedBox(
            width: 120,
            height: 120,
            child: PieChart(
              PieChartData(
                sectionsSpace: 2,
                centerSpaceRadius: 28,
                sections: stats.map((s) {
                  final pct = total > 0 ? s.minutesWatched / total : 0.0;
                  return PieChartSectionData(
                    value: s.minutesWatched.toDouble(),
                    color: Color(s.colorValue),
                    radius: 45,
                    title: '${(pct * 100).toInt()}%',
                    titleStyle: AppTextStyles.labelMedium.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.lg),
          // Legend
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < stats.length; i++) ...[
                  _LegendItem(stat: stats[i]),
                  if (i < stats.length - 1)
                    const Divider(
                      color: AppColors.border,
                      height: 20,
                      thickness: 0.5,
                    ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  const _LegendItem({required this.stat});

  final LanguageStat stat;

  @override
  Widget build(BuildContext context) {
    final hours = stat.minutesWatched ~/ 60;
    final mins = stat.minutesWatched % 60;
    final timeLabel = hours > 0 ? '${hours}h ${mins}m' : '${mins}m';

    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: Color(stat.colorValue),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Text(
            stat.language,
            style: AppTextStyles.labelMedium,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(timeLabel, style: AppTextStyles.labelMedium),
            Text(
              '${stat.wordsLearned} words',
              style: AppTextStyles.caption,
            ),
          ],
        ),
      ],
    );
  }
}

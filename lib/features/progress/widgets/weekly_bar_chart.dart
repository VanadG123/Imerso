import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../data/models/progress_model.dart';

class WeeklyBarChart extends StatelessWidget {
  const WeeklyBarChart({super.key, required this.weeklyActivity});

  final List<DayActivity> weeklyActivity;

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        height: 200,
        child: BarChart(
          BarChartData(
            barTouchData: BarTouchData(
              touchTooltipData: BarTouchTooltipData(
                tooltipBgColor: const Color(0xFF1E1E2A),
                getTooltipItem: (group, groupIndex, rod, rodIndex) =>
                    BarTooltipItem(
                  '${rod.toY.toInt()} min',
                  AppTextStyles.labelMedium.copyWith(color: Colors.white),
                ),
              ),
            ),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    const days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
                    final idx = value.toInt();
                    if (idx < 0 || idx >= days.length) {
                      return const SizedBox.shrink();
                    }
                    return Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(days[idx], style: AppTextStyles.caption),
                    );
                  },
                ),
              ),
              leftTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              horizontalInterval: 20,
              getDrawingHorizontalLine: (_) => const FlLine(
                color: AppColors.border,
                strokeWidth: 0.5,
              ),
            ),
            borderData: FlBorderData(show: false),
            barGroups: weeklyActivity.asMap().entries.map((e) {
              final isToday = e.value.date.day == today.day &&
                  e.value.date.month == today.month;
              return BarChartGroupData(
                x: e.key,
                barRods: [
                  BarChartRodData(
                    toY: e.value.minutesWatched.toDouble(),
                    width: 18,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(6),
                    ),
                    gradient: LinearGradient(
                      colors: isToday
                          ? [AppColors.accent, AppColors.primary]
                          : [
                              AppColors.primary.withValues(alpha: 0.6),
                              AppColors.primary,
                            ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

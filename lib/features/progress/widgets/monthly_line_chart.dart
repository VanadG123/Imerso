import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_text_styles.dart';

class MonthlyLineChart extends StatelessWidget {
  const MonthlyLineChart({super.key, required this.monthlyMinutes});

  final List<int> monthlyMinutes;

  @override
  Widget build(BuildContext context) {
    final maxY = (monthlyMinutes.reduce((a, b) => a > b ? a : b) + 20).toDouble();

    return Container(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.md,
        AppSpacing.md,
        AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        height: 180,
        child: LineChart(
          LineChartData(
            lineTouchData: LineTouchData(
              touchTooltipData: LineTouchTooltipData(
                tooltipBgColor: const Color(0xFF1E1E2A),
                getTooltipItems: (spots) => spots
                    .map(
                      (s) => LineTooltipItem(
                        '${s.y.toInt()} min',
                        AppTextStyles.labelMedium
                            .copyWith(color: Colors.white),
                      ),
                    )
                    .toList(),
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
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 7,
                  getTitlesWidget: (value, meta) {
                    final week = (value ~/ 7) + 1;
                    return Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        'W$week',
                        style: AppTextStyles.caption,
                      ),
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
            borderData: FlBorderData(show: false),
            minX: 0,
            maxX: 29,
            minY: 0,
            maxY: maxY,
            lineBarsData: [
              LineChartBarData(
                spots: monthlyMinutes
                    .asMap()
                    .entries
                    .map((e) => FlSpot(e.key.toDouble(), e.value.toDouble()))
                    .toList(),
                isCurved: true,
                curveSmoothness: 0.3,
                color: AppColors.primary,
                barWidth: 2,
                dotData: const FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary.withValues(alpha: 0.3),
                      AppColors.primary.withValues(alpha: 0.0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

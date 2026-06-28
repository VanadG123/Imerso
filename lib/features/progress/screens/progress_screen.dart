import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/widgets/app_badge.dart';
import '../providers/progress_provider.dart';
import '../widgets/activity_calendar.dart';
import '../widgets/language_pie_chart.dart';
import '../widgets/level_progress_bar.dart';
import '../widgets/monthly_line_chart.dart';
import '../widgets/stat_card.dart';
import '../widgets/weekly_bar_chart.dart';

class ProgressScreen extends ConsumerWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(userProgressProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // ── App bar ──────────────────────────────────────────────────────
          SliverAppBar(
            floating: true,
            pinned: false,
            backgroundColor: AppColors.background,
            surfaceTintColor: Colors.transparent,
            title: Text('Progress', style: AppTextStyles.headingLarge),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: AppSpacing.md),
                child: CircleAvatar(
                  radius: 18,
                  backgroundImage: CachedNetworkImageProvider(
                    'https://i.pravatar.cc/100?img=3',
                  ),
                  backgroundColor: AppColors.card,
                ),
              ),
            ],
          ),

          // ── Greeting + level card ─────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                AppSpacing.md,
                AppSpacing.md,
                AppSpacing.md,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Keep it up! 🔥', style: AppTextStyles.headingMedium),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    'You\'re making great progress this week.',
                    style: AppTextStyles.bodyMedium
                        .copyWith(color: AppColors.onSurfaceMuted),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  // Level card
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Current Level',
                                  style: AppTextStyles.caption,
                                ),
                                Text(
                                  progress.currentLevel,
                                  style: AppTextStyles.displayMedium.copyWith(
                                    color: AppColors.primaryLight,
                                  ),
                                ),
                              ],
                            ),
                            AppBadge(
                              label:
                                  '${(progress.levelProgressPercent * 100).toInt()}% to ${progress.targetLevel}',
                              color: AppColors.primary,
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.md),
                        LevelProgressBar(
                          currentLevel: progress.currentLevel,
                          targetLevel: progress.targetLevel,
                          percent: progress.levelProgressPercent,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Stats grid ────────────────────────────────────────────────
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: AppSpacing.md,
                crossAxisSpacing: AppSpacing.md,
                childAspectRatio: 1.4,
              ),
              delegate: SliverChildListDelegate([
                StatCard(
                  icon: Icons.schedule_rounded,
                  iconColor: AppColors.secondary,
                  value: ref.watch(formattedTotalTimeProvider),
                  label: 'Total immersion',
                  trend:
                      '↑ ${ref.watch(weekTotalMinutesProvider)} min this week',
                  trendColor: AppColors.success,
                ),
                StatCard(
                  icon: Icons.local_fire_department_rounded,
                  iconColor: const Color(0xFFFF6B35),
                  value: '${progress.currentStreakDays} days',
                  label: 'Current streak',
                  trend: 'Best: ${progress.longestStreakDays} days',
                  trendColor: AppColors.warning,
                ),
                StatCard(
                  icon: Icons.psychology_rounded,
                  iconColor: AppColors.primary,
                  value: '${progress.vocabularyLearned}',
                  label: 'Words learned',
                  trend: '${progress.vocabularyMastered} mastered',
                  trendColor: AppColors.primaryLight,
                ),
                StatCard(
                  icon: Icons.play_circle_rounded,
                  iconColor: AppColors.accent,
                  value: '${progress.videosWatched}',
                  label: 'Videos watched',
                  trend: '↑ today: ${ref.watch(todayMinutesProvider)} min',
                  trendColor: AppColors.success,
                ),
              ]),
            ),
          ),

          // ── Weekly bar chart ──────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _SectionHeader(
                    'This Week',
                    subtitle: 'Daily time in minutes',
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  WeeklyBarChart(weeklyActivity: progress.weeklyActivity),
                ],
              ),
            ),
          ),

          // ── Monthly line chart ────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                0,
                AppSpacing.md,
                AppSpacing.md,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _SectionHeader(
                    '30-Day Trend',
                    subtitle: 'Minutes per day over the month',
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  MonthlyLineChart(monthlyMinutes: progress.monthlyMinutes),
                ],
              ),
            ),
          ),

          // ── Language breakdown ────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                0,
                AppSpacing.md,
                AppSpacing.md,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _SectionHeader(
                    'Languages',
                    subtitle: 'Time split across your languages',
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  LanguagePieChart(
                    stats: progress.languageBreakdown,
                  ),
                ],
              ),
            ),
          ),

          // ── Activity calendar ─────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                0,
                AppSpacing.md,
                AppSpacing.md,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _SectionHeader(
                    'Activity',
                    subtitle: 'Last 28 days',
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  ActivityCalendar(monthlyMinutes: progress.monthlyMinutes),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xxl)),
        ],
      ),
    );
  }
}

// ── Section header ────────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.title, {this.subtitle});

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: AppTextStyles.headingSmall),
        if (subtitle != null)
          Text(
            subtitle!,
            style: AppTextStyles.caption,
          ),
      ],
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../progress/widgets/level_progress_bar.dart';
import '../providers/profile_provider.dart';
import '../widgets/achievement_card.dart';
import '../widgets/saved_thumbnail_card.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  static String _flagEmoji(String language) =>
      const {
        'Japanese': '🇯🇵',
        'Spanish': '🇪🇸',
        'Korean': '🇰🇷',
        'French': '🇫🇷',
      }[language] ??
      '🌐';

  static String _nextLevel(String current) =>
      const {
        'A1': 'A2',
        'A2': 'B1',
        'B1': 'B2',
        'B2': 'C1',
        'C1': 'C2',
      }[current] ??
      'C2';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(userProfileProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // ── Collapsing header ──────────────────────────────────────────────
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.background,
            surfaceTintColor: Colors.transparent,
            actions: [
              IconButton(
                icon: const Icon(Icons.settings_rounded, color: Colors.white),
                tooltip: 'Open settings',
                onPressed: () => context.push('/settings'),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary.withValues(alpha: 0.6),
                      AppColors.background,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Avatar with gradient ring
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: AppColors.gradientAccent,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 44,
                          backgroundImage:
                              CachedNetworkImageProvider(profile.avatarUrl),
                          backgroundColor: AppColors.card,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text(profile.displayName, style: AppTextStyles.headingLarge),
                      Text(
                        profile.handle,
                        style: AppTextStyles.bodyMedium
                            .copyWith(color: AppColors.onSurfaceMuted),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: AppColors.border),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 6,
                          ),
                          textStyle: AppTextStyles.labelMedium,
                        ),
                        child: const Text('Edit Profile'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ── Stats row ─────────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                AppSpacing.md,
                AppSpacing.md,
                0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _StatColumn(
                      value: '${profile.totalVideosWatched}',
                      label: 'Videos',
                    ),
                    const _VerticalDivider(),
                    _StatColumn(
                      value: '${profile.totalWordsLearned}',
                      label: 'Words',
                    ),
                    const _VerticalDivider(),
                    _StatColumn(
                      value: '${profile.currentStreakDays}d',
                      label: 'Streak',
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ── Currently learning ────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                AppSpacing.md,
                AppSpacing.md,
                0,
              ),
              child: Container(
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
                        Text(
                          'Currently Learning',
                          style: AppTextStyles.labelLarge,
                        ),
                        TextButton(
                          onPressed: () => context.go('/shell/progress'),
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.primaryLight,
                            padding: EdgeInsets.zero,
                          ),
                          child: const Text('Progress →'),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Row(
                      children: [
                        Text(
                          _flagEmoji(profile.targetLanguage),
                          style: const TextStyle(fontSize: 24),
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              profile.targetLanguage,
                              style: AppTextStyles.labelLarge,
                            ),
                            Text(
                              profile.currentLevel,
                              style: AppTextStyles.caption.copyWith(
                                color: AppColors.primaryLight,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.md),
                    LevelProgressBar(
                      currentLevel: profile.currentLevel,
                      targetLevel: _nextLevel(profile.currentLevel),
                      percent: profile.levelProgressPercent,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ── Achievements ──────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                AppSpacing.md,
                AppSpacing.md,
                0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Achievements',
                        style: AppTextStyles.headingSmall,
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.primaryLight,
                          padding: EdgeInsets.zero,
                        ),
                        child: const Text('See All'),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  SizedBox(
                    height: 130,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: profile.achievements.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(width: AppSpacing.sm),
                      itemBuilder: (_, i) => AchievementCard(
                        achievement: profile.achievements[i],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Saved videos ──────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                AppSpacing.md,
                AppSpacing.md,
                AppSpacing.xxl,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Saved Videos', style: AppTextStyles.headingSmall),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.primaryLight,
                          padding: EdgeInsets.zero,
                        ),
                        child: const Text('See All'),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: AppSpacing.sm,
                      mainAxisSpacing: AppSpacing.sm,
                      childAspectRatio: 9 / 16,
                    ),
                    itemCount: profile.savedVideoThumbnails.length,
                    itemBuilder: (_, i) => SavedThumbnailCard(
                      thumbnailUrl: profile.savedVideoThumbnails[i],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Private helper widgets ────────────────────────────────────────────────────

class _StatColumn extends StatelessWidget {
  const _StatColumn({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(value, style: AppTextStyles.headingMedium),
        Text(label, style: AppTextStyles.caption),
      ],
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider();

  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 36, color: AppColors.border);
  }
}

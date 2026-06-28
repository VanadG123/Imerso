import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../data/mock/mock_profile.dart';
import '../providers/settings_provider.dart';
import '../widgets/settings_section.dart';
import '../widgets/settings_tile.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsNotifierProvider);
    final notifier = ref.read(settingsNotifierProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // ── App bar ──────────────────────────────────────────────────────
          SliverAppBar(
            pinned: true,
            backgroundColor: AppColors.background,
            surfaceTintColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
              tooltip: 'Go back',
              onPressed: () => context.pop(),
            ),
            title: Text('Settings', style: AppTextStyles.headingLarge),
          ),

          // ── Profile header tile ───────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: CachedNetworkImageProvider(
                        mockUserProfile.avatarUrl,
                      ),
                      backgroundColor: AppColors.card,
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          mockUserProfile.displayName,
                          style: AppTextStyles.labelLarge,
                        ),
                        Text(
                          mockUserProfile.handle,
                          style: AppTextStyles.bodySmall
                              .copyWith(color: AppColors.onSurfaceMuted),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.chevron_right_rounded,
                      color: AppColors.onSurfaceMuted,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ── Settings sections ──────────────────────────────────────────
          SliverList(
            delegate: SliverChildListDelegate([
              // ACCOUNT
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.md,
                  0,
                  AppSpacing.md,
                  AppSpacing.md,
                ),
                child: SettingsSection(
                  title: 'ACCOUNT',
                  children: [
                    SettingsTile(
                      icon: Icons.notifications_rounded,
                      label: 'Notifications',
                      subtitle: settings.notificationsEnabled ? 'On' : 'Off',
                      iconColor: AppColors.warning,
                      trailing: Switch(
                        value: settings.notificationsEnabled,
                        onChanged: (_) => notifier.toggleNotifications(),
                        activeThumbColor: AppColors.primary,
                      ),
                    ),
                    SettingsTile(
                      icon: Icons.lock_rounded,
                      label: 'Privacy',
                      iconColor: AppColors.secondary,
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              // LEARNING
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.md,
                  0,
                  AppSpacing.md,
                  AppSpacing.md,
                ),
                child: SettingsSection(
                  title: 'LEARNING',
                  children: [
                    SettingsTile(
                      icon: Icons.flag_rounded,
                      label: 'Daily Goal',
                      subtitle:
                          '${settings.dailyGoalMinutes} minutes per day',
                      iconColor: AppColors.success,
                      onTap: () => _showDailyGoalSheet(context, ref),
                    ),
                    SettingsTile(
                      icon: Icons.auto_graph_rounded,
                      label: 'Difficulty Auto-Adjustment',
                      subtitle: 'Adapts content to your level',
                      iconColor: AppColors.primary,
                      trailing: Switch(
                        value: settings.difficultyAutoAdjust,
                        onChanged: (_) => notifier.toggleDifficultyAdjust(),
                        activeThumbColor: AppColors.primary,
                      ),
                    ),
                    SettingsTile(
                      icon: Icons.language_rounded,
                      label: 'Target Language',
                      subtitle: mockUserProfile.targetLanguage,
                      iconColor: AppColors.accent,
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              // APPEARANCE
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.md,
                  0,
                  AppSpacing.md,
                  AppSpacing.md,
                ),
                child: SettingsSection(
                  title: 'APPEARANCE',
                  children: [
                    SettingsTile(
                      icon: Icons.dark_mode_rounded,
                      label: 'App Theme',
                      subtitle: 'Dark (default)',
                      iconColor: AppColors.onSurfaceMuted,
                      trailing: Text('Dark', style: AppTextStyles.caption),
                    ),
                    SettingsTile(
                      icon: Icons.text_fields_rounded,
                      label: 'Text Size',
                      subtitle: _capitalize(settings.textSize),
                      iconColor: AppColors.secondary,
                      onTap: () => _showTextSizeSheet(context, ref),
                    ),
                  ],
                ),
              ),

              // SUPPORT
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.md,
                  0,
                  AppSpacing.md,
                  AppSpacing.md,
                ),
                child: SettingsSection(
                  title: 'SUPPORT',
                  children: [
                    SettingsTile(
                      icon: Icons.info_outline_rounded,
                      label: 'About Imerso',
                      iconColor: AppColors.primary,
                      onTap: () => _showAboutDialog(context),
                    ),
                    SettingsTile(
                      icon: Icons.star_outline_rounded,
                      label: 'Rate the App',
                      iconColor: AppColors.warning,
                      onTap: () {},
                    ),
                    SettingsTile(
                      icon: Icons.privacy_tip_outlined,
                      label: 'Privacy Policy',
                      iconColor: AppColors.onSurfaceMuted,
                      onTap: () {},
                    ),
                    SettingsTile(
                      icon: Icons.description_outlined,
                      label: 'Terms of Service',
                      iconColor: AppColors.onSurfaceMuted,
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              // DANGER ZONE
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.md,
                  0,
                  AppSpacing.md,
                  AppSpacing.md,
                ),
                child: SettingsSection(
                  title: 'DANGER ZONE',
                  isDanger: true,
                  children: [
                    SettingsTile(
                      icon: Icons.restart_alt_rounded,
                      label: 'Reset Progress',
                      isDestructive: true,
                      onTap: () => _showResetDialog(context, ref),
                    ),
                    SettingsTile(
                      icon: Icons.logout_rounded,
                      label: 'Reset Onboarding',
                      subtitle: 'Return to welcome screen',
                      isDestructive: true,
                      onTap: () => _showLogoutDialog(context, ref),
                    ),
                  ],
                ),
              ),
            ]),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: AppSpacing.xxl),
          ),
        ],
      ),
    );
  }

  // ── Bottom sheets ─────────────────────────────────────────────────────────

  void _showDailyGoalSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        final currentGoal = ref.read(settingsNotifierProvider).dailyGoalMinutes;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Text(
                'Daily Goal',
                style: AppTextStyles.headingSmall,
                textAlign: TextAlign.center,
              ),
            ),
            for (final minutes in [15, 30, 45, 60])
              ListTile(
                title: Text(
                  '$minutes minutes',
                  style: AppTextStyles.bodyMedium,
                ),
                trailing: currentGoal == minutes
                    ? const Icon(
                        Icons.check_rounded,
                        color: AppColors.primary,
                      )
                    : null,
                onTap: () {
                  ref
                      .read(settingsNotifierProvider.notifier)
                      .setDailyGoal(minutes);
                  Navigator.pop(ctx);
                },
              ),
            const SizedBox(height: AppSpacing.md),
          ],
        );
      },
    );
  }

  void _showTextSizeSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        final currentSize = ref.read(settingsNotifierProvider).textSize;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Text(
                'Text Size',
                style: AppTextStyles.headingSmall,
                textAlign: TextAlign.center,
              ),
            ),
            for (final size in ['small', 'medium', 'large'])
              ListTile(
                title: Text(
                  _capitalize(size),
                  style: AppTextStyles.bodyMedium,
                ),
                trailing: currentSize == size
                    ? const Icon(
                        Icons.check_rounded,
                        color: AppColors.primary,
                      )
                    : null,
                onTap: () {
                  ref
                      .read(settingsNotifierProvider.notifier)
                      .setTextSize(size);
                  Navigator.pop(ctx);
                },
              ),
            const SizedBox(height: AppSpacing.md),
          ],
        );
      },
    );
  }

  // ── Dialogs ───────────────────────────────────────────────────────────────

  void _showResetDialog(BuildContext context, WidgetRef ref) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.card,
        title: Text('Reset Progress?', style: AppTextStyles.headingSmall),
        content: Text(
          'This will clear all your progress data. Your account stays active.',
          style: AppTextStyles.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: AppColors.error,
            ),
            onPressed: () {
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Progress reset (mock — no data cleared)'),
                ),
              );
            },
            child: const Text('Reset'),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, WidgetRef ref) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.card,
        title: Text('Reset Onboarding?', style: AppTextStyles.headingSmall),
        content: Text(
          'You will be taken back to the welcome screen.',
          style: AppTextStyles.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: AppColors.error,
            ),
            onPressed: () {
              Navigator.pop(ctx);
              ref
                  .read(settingsNotifierProvider.notifier)
                  .resetOnboarding(context);
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'Imerso',
      applicationVersion: '1.0.0 (MVP)',
      applicationLegalese: '© 2026 Imerso. All rights reserved.',
      children: [
        const SizedBox(height: 16),
        Text(
          'Learn languages by immersing yourself in real short-form content.',
          style: AppTextStyles.bodyMedium,
        ),
      ],
    );
  }

  // ── Helpers ───────────────────────────────────────────────────────────────

  String _capitalize(String s) =>
      s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);
}

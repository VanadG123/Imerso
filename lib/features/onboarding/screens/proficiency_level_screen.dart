import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/widgets/app_button.dart';
import '../../../data/mock/mock_languages.dart';
import '../../../data/models/language_model.dart';
import '../providers/onboarding_provider.dart';

class ProficiencyLevelScreen extends ConsumerWidget {
  const ProficiencyLevelScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingNotifierProvider);
    final notifier = ref.read(onboardingNotifierProvider.notifier);

    final targetName = state.targetLanguage?.name ?? 'your language';
    final selected = state.proficiencyLevel;
    final canContinue = selected != null && !state.isSaving;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _ProficiencyHeader(onBack: () => context.pop()),
            const SizedBox(height: AppSpacing.lg),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "What's your $targetName level?",
                    style: AppTextStyles.headingLarge,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    AppStrings.levelSubheading,
                    style: AppTextStyles.bodyMedium
                        .copyWith(color: AppColors.onSurfaceMuted),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                itemCount: MockLanguages.levels.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(height: AppSpacing.sm),
                itemBuilder: (context, index) {
                  final level = MockLanguages.levels[index];
                  return _LevelCard(
                    level: level,
                    isSelected: selected?.code == level.code,
                    animationIndex: index,
                    onTap: () => notifier.selectProficiencyLevel(level),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                AppSpacing.sm,
                AppSpacing.lg,
                AppSpacing.md,
              ),
              child: AppButton(
                label: AppStrings.startLearning,
                isLoading: state.isSaving,
                onTap: canContinue
                    ? () async {
                        await notifier.completeOnboarding();
                        if (context.mounted) context.go('/shell/home');
                      }
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Level card ────────────────────────────────────────────────────────────────

class _LevelCard extends StatelessWidget {
  const _LevelCard({
    required this.level,
    required this.isSelected,
    required this.animationIndex,
    required this.onTap,
  });

  final ProficiencyLevel level;
  final bool isSelected;
  final int animationIndex;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final delay = (animationIndex * 50).ms;

    // Gradient border: outer container has gradient, inner has card bg + 2px inset
    Widget card = GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        height: 80,
        padding: isSelected ? const EdgeInsets.all(2) : EdgeInsets.zero,
        decoration: isSelected
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient:
                    const LinearGradient(colors: AppColors.gradientPrimary),
              )
            : BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
        child: isSelected
            ? Container(
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(14),
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md, vertical: AppSpacing.sm),
                child: _CardContent(level: level, isSelected: true),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md, vertical: AppSpacing.sm),
                child: _CardContent(level: level, isSelected: false),
              ),
      ),
    );

    return card
        .animate()
        .fadeIn(delay: delay, duration: 350.ms)
        .slideY(
          begin: 0.2,
          end: 0,
          delay: delay,
          duration: 350.ms,
          curve: Curves.easeOut,
        );
  }
}

class _CardContent extends StatelessWidget {
  const _CardContent({required this.level, required this.isSelected});

  final ProficiencyLevel level;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primary.withValues(alpha: 0.15)
                : AppColors.surface,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              level.code,
              style: AppTextStyles.headingSmall.copyWith(
                color: isSelected ? AppColors.primary : AppColors.onSurface,
              ),
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(level.name, style: AppTextStyles.labelLarge),
              const SizedBox(height: 2),
              Text(
                level.description,
                style: AppTextStyles.bodySmall
                    .copyWith(color: AppColors.onSurfaceMuted),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Icon(
          Icons.arrow_forward_ios_rounded,
          size: 16,
          color:
              isSelected ? AppColors.primary : AppColors.onSurfaceMuted,
        ),
      ],
    );
  }
}

// ── Header ────────────────────────────────────────────────────────────────────

class _ProficiencyHeader extends StatelessWidget {
  const _ProficiencyHeader({required this.onBack});
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
              AppSpacing.sm, AppSpacing.sm, AppSpacing.lg, 0),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded,
                    color: AppColors.onSurface, size: 20),
                onPressed: onBack,
              ),
              const Spacer(),
              Text(
                'Step 3 ${AppStrings.stepOf} 3',
                style: AppTextStyles.labelMedium
                    .copyWith(color: AppColors.onSurfaceMuted),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: LayoutBuilder(
            builder: (context, constraints) => Stack(
              children: [
                Container(
                  height: 3,
                  width: constraints.maxWidth,
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                Container(
                  height: 3,
                  width: constraints.maxWidth,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: AppColors.gradientPrimary),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

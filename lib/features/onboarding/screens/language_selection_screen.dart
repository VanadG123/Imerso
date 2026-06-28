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

class LanguageSelectionScreen extends ConsumerWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingNotifierProvider);
    final notifier = ref.read(onboardingNotifierProvider.notifier);
    final isStepA = state.currentStep == 0;

    final stepLabel = isStepA ? '1' : '2';
    final heading = isStepA
        ? AppStrings.nativeLanguageHeading
        : AppStrings.targetLanguageHeading;
    final subheading = isStepA
        ? AppStrings.nativeLanguageSubheading
        : AppStrings.targetLanguageSubheading;

    final languages = isStepA
        ? MockLanguages.all
        : MockLanguages.all
            .where((l) => l.code != state.nativeLanguage?.code)
            .toList();

    final selected = isStepA ? state.nativeLanguage : state.targetLanguage;
    final canContinue = selected != null;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // ── Header ──────────────────────────────────────────────────────
            _OnboardingHeader(
              stepLabel: stepLabel,
              totalSteps: '3',
              progress: isStepA ? 1 / 3 : 2 / 3,
              onBack: isStepA
                  ? () => context.pop()
                  : () => notifier.goToStep(0),
            ),
            const SizedBox(height: AppSpacing.lg),
            // ── Heading ─────────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, anim) => FadeTransition(
                  opacity: anim,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.05, 0),
                      end: Offset.zero,
                    ).animate(anim),
                    child: child,
                  ),
                ),
                child: Column(
                  key: ValueKey(isStepA),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(heading, style: AppTextStyles.headingLarge),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      subheading,
                      style: AppTextStyles.bodyMedium
                          .copyWith(color: AppColors.onSurfaceMuted),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            // ── Language grid ────────────────────────────────────────────────
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _LanguageGrid(
                  key: ValueKey(isStepA),
                  languages: languages,
                  selected: selected,
                  onSelect: isStepA
                      ? notifier.selectNativeLanguage
                      : notifier.selectTargetLanguage,
                ),
              ),
            ),
            // ── Footer ───────────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                AppSpacing.sm,
                AppSpacing.lg,
                AppSpacing.md,
              ),
              child: AppButton(
                label: AppStrings.onboardingContinue,
                onTap: canContinue
                    ? () {
                        if (isStepA) {
                          notifier.goToStep(1);
                        } else {
                          context.push('/onboarding/level');
                        }
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

// ── Language grid ─────────────────────────────────────────────────────────────

class _LanguageGrid extends StatelessWidget {
  const _LanguageGrid({
    super.key,
    required this.languages,
    required this.selected,
    required this.onSelect,
  });

  final List<Language> languages;
  final Language? selected;
  final ValueChanged<Language> onSelect;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: AppSpacing.sm,
        crossAxisSpacing: AppSpacing.sm,
        mainAxisExtent: 100,
      ),
      itemCount: languages.length,
      itemBuilder: (context, index) {
        final lang = languages[index];
        final isSelected = selected?.code == lang.code;
        return _LanguageCard(
          language: lang,
          isSelected: isSelected,
          onTap: () => onSelect(lang),
          animationIndex: index,
        );
      },
    );
  }
}

class _LanguageCard extends StatefulWidget {
  const _LanguageCard({
    required this.language,
    required this.isSelected,
    required this.onTap,
    required this.animationIndex,
  });

  final Language language;
  final bool isSelected;
  final VoidCallback onTap;
  final int animationIndex;

  @override
  State<_LanguageCard> createState() => _LanguageCardState();
}

class _LanguageCardState extends State<_LanguageCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _press;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _press = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
      reverseDuration: const Duration(milliseconds: 200),
      lowerBound: 0,
      upperBound: 1,
    );
    _scale = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _press, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _press.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final delay = (widget.animationIndex * 40).ms;
    return ScaleTransition(
      scale: _scale,
      child: GestureDetector(
        onTapDown: (_) => _press.forward(),
        onTapUp: (_) {
          _press.reverse();
          widget.onTap();
        },
        onTapCancel: () => _press.reverse(),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: widget.isSelected
                  ? AppColors.primary
                  : AppColors.border,
              width: widget.isSelected ? 2 : 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.language.flag,
                  style: const TextStyle(fontSize: 40, height: 1.1)),
              const SizedBox(height: AppSpacing.xs),
              Text(
                widget.language.name,
                style: AppTextStyles.labelLarge.copyWith(
                  color: widget.isSelected
                      ? AppColors.primary
                      : AppColors.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(delay: delay, duration: 300.ms)
        .slideY(begin: 0.15, end: 0, delay: delay, duration: 300.ms, curve: Curves.easeOut);
  }
}

// ── Shared header widget ──────────────────────────────────────────────────────

class _OnboardingHeader extends StatelessWidget {
  const _OnboardingHeader({
    required this.stepLabel,
    required this.totalSteps,
    required this.progress,
    required this.onBack,
  });

  final String stepLabel;
  final String totalSteps;
  final double progress;
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
                'Step $stepLabel ${AppStrings.stepOf} $totalSteps',
                style: AppTextStyles.labelMedium
                    .copyWith(color: AppColors.onSurfaceMuted),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: _ProgressBar(progress: progress),
        ),
      ],
    );
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar({required this.progress});
  final double progress;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Container(
              height: 3,
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              height: 3,
              width: constraints.maxWidth * progress,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: AppColors.gradientPrimary),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ],
        );
      },
    );
  }
}

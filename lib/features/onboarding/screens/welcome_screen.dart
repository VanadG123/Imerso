import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/widgets/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final totalHeight = constraints.maxHeight;
            return Column(
              children: [
                // ── Hero area (60%) ──────────────────────────────────────────
                SizedBox(
                  height: totalHeight * 0.58,
                  child: _HeroArea(),
                ),
                // ── Content area (40%) ───────────────────────────────────────
                Expanded(
                  child: _ContentArea(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// ── Hero ─────────────────────────────────────────────────────────────────────

class _HeroArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Background gradient
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1A0A3D), Color(0xFF0D1B3E), AppColors.background],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        // Ambient glow
        Positioned(
          top: -40,
          left: -60,
          child: Container(
            width: 280,
            height: 280,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.primary.withValues(alpha: 0.25),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          right: -40,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.accent.withValues(alpha: 0.18),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        // Feature cards
        const Positioned(
          top: 40,
          left: 24,
          right: 24,
          child: Column(
            children: [
              _FeatureCard(
                emoji: '🎬',
                label: AppStrings.welcomeCard1,
                rotation: -0.03,
                animationDelay: 0,
              ),
              SizedBox(height: 12),
              _FeatureCard(
                emoji: '📖',
                label: AppStrings.welcomeCard2,
                rotation: 0.02,
                animationDelay: 120,
              ),
              SizedBox(height: 12),
              _FeatureCard(
                emoji: '📈',
                label: AppStrings.welcomeCard3,
                rotation: -0.015,
                animationDelay: 240,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    required this.emoji,
    required this.label,
    required this.rotation,
    required this.animationDelay,
  });

  final String emoji;
  final String label;
  final double rotation;
  final int animationDelay;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotation,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm + 4,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.10),
              ),
            ),
            child: Row(
              children: [
                Text(emoji, style: const TextStyle(fontSize: 24)),
                const SizedBox(width: AppSpacing.md),
                Text(label, style: AppTextStyles.labelLarge),
              ],
            ),
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(delay: Duration(milliseconds: animationDelay), duration: 500.ms)
        .slideX(
          begin: -0.15,
          end: 0,
          delay: Duration(milliseconds: animationDelay),
          duration: 500.ms,
          curve: Curves.easeOut,
        );
  }
}

// ── Content ───────────────────────────────────────────────────────────────────

class _ContentArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.md,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.welcomeHeading,
            style: AppTextStyles.displayLarge,
          )
              .animate()
              .fadeIn(delay: 300.ms, duration: 500.ms)
              .slideY(begin: 0.2, end: 0, delay: 300.ms, duration: 500.ms, curve: Curves.easeOut),
          const SizedBox(height: AppSpacing.sm),
          Text(
            AppStrings.welcomeBody,
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.onSurfaceMuted),
          )
              .animate()
              .fadeIn(delay: 400.ms, duration: 500.ms)
              .slideY(begin: 0.2, end: 0, delay: 400.ms, duration: 500.ms, curve: Curves.easeOut),
          const Spacer(),
          AppButton(
            label: AppStrings.welcomeGetStarted,
            onTap: () => context.push('/onboarding/language'),
          )
              .animate()
              .fadeIn(delay: 500.ms, duration: 400.ms)
              .slideY(begin: 0.3, end: 0, delay: 500.ms, duration: 400.ms, curve: Curves.easeOut),
          const SizedBox(height: AppSpacing.sm),
          Center(
            child: TextButton(
              onPressed: null, // MVP placeholder
              child: Text(
                AppStrings.welcomeHaveAccount,
                style: AppTextStyles.bodyMedium.copyWith(color: AppColors.onSurfaceMuted),
              ),
            ),
          ).animate().fadeIn(delay: 600.ms, duration: 400.ms),
        ],
      ),
    );
  }
}

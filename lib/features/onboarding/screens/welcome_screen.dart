import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/app_colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080810),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isShort = constraints.maxHeight < 700;
            final heroHeight = constraints.maxHeight * (isShort ? 0.38 : 0.42);
            final headlineFontSize = isShort ? 32.0 : 38.0;

            return SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 430),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _TopBar(),
                      SizedBox(
                        height: heroHeight,
                        child: const _HeroSection(),
                      ),
                      const _FeatureRow()
                          .animate()
                          .fadeIn(delay: 400.ms, duration: 400.ms)
                          .slideY(
                            begin: 0.1,
                            duration: 400.ms,
                            delay: 400.ms,
                            curve: Curves.easeOutCubic,
                          ),
                      _CTASection(headlineFontSize: headlineFontSize),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// ── Top bar ───────────────────────────────────────────────────────────────────

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'IMERSO',
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                letterSpacing: 2.5,
                color: Colors.white,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.12),
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                'BETA',
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2,
                  color: Colors.white.withValues(alpha: 0.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Hero section ──────────────────────────────────────────────────────────────

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    final leftCard = Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..rotateZ(-0.08)
        ..translateByDouble(-10.0, 0.0, 0.0, 0.0),
      child: Container(
        width: 140,
        height: 185,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xFF13131F),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.05),
          ),
        ),
        child: Center(
          child: Text(
            'Español',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white.withValues(alpha: 0.3),
            ),
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(delay: 50.ms, duration: 500.ms)
        .slideX(
          begin: -0.15,
          duration: 500.ms,
          delay: 50.ms,
          curve: Curves.easeOutCubic,
        );

    final rightCard = Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..rotateZ(0.08)
        ..translateByDouble(10.0, 0.0, 0.0, 0.0),
      child: Container(
        width: 140,
        height: 185,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xFF13131F),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.05),
          ),
        ),
        child: Center(
          child: Text(
            '한국어',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white.withValues(alpha: 0.3),
            ),
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(delay: 100.ms, duration: 500.ms)
        .slideX(
          begin: 0.15,
          duration: 500.ms,
          delay: 100.ms,
          curve: Curves.easeOutCubic,
        );

    final mainCard = Container(
      width: 280,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF7C3AED).withValues(alpha: 0.3),
            blurRadius: 40,
            spreadRadius: 0,
            offset: const Offset(0, 16),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            // Video thumbnail gradient
            const Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF1E1B4B),
                      Color(0xFF312E81),
                      Color(0xFF1E1B4B),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),

            // Decorative circle (top-right accent)
            Positioned(
              top: -20,
              right: -20,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF7C3AED).withValues(alpha: 0.3),
                ),
              ),
            ),

            // Japanese text centred
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '日本語',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w700,
                      color: Colors.white.withValues(alpha: 0.9),
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'にほんご',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withValues(alpha: 0.45),
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),

            // Bottom info strip
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.8),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 9,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(text: 'これは'),
                            TextSpan(
                              text: '美味しい',
                              style: TextStyle(
                                color: AppColors.primaryLight,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.primaryLight,
                              ),
                            ),
                            TextSpan(text: 'です'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Container(
                          width: 16,
                          height: 16,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF7C3AED),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '@yukinative',
                          style: TextStyle(
                            fontSize: 8,
                            color: Colors.white.withValues(alpha: 0.7),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF7C3AED)
                                .withValues(alpha: 0.4),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'N5',
                            style: TextStyle(
                              fontSize: 7,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFA78BFA),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Side action icons
            Positioned(
              right: 8,
              top: 80,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.favorite_border_rounded,
                    color: Colors.white.withValues(alpha: 0.6),
                    size: 16,
                  ),
                  const SizedBox(height: 8),
                  Icon(
                    Icons.bookmark_border_rounded,
                    color: Colors.white.withValues(alpha: 0.6),
                    size: 16,
                  ),
                  const SizedBox(height: 8),
                  Icon(
                    Icons.translate_outlined,
                    color: Colors.white.withValues(alpha: 0.6),
                    size: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(delay: 200.ms, duration: 600.ms)
        .slideY(
          begin: 0.08,
          duration: 600.ms,
          delay: 200.ms,
          curve: Curves.easeOutCubic,
        )
        .scale(
          begin: const Offset(0.95, 0.95),
          delay: 200.ms,
          duration: 600.ms,
          curve: Curves.easeOutBack,
        );

    return Stack(
      fit: StackFit.expand,
      children: [
        // Background glow
        Positioned(
          top: 20,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 260,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(120),
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF7C3AED).withValues(alpha: 0.35),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ),
        // Left language card (behind)
        Positioned(left: 16, top: 40, child: leftCard),
        // Right language card (behind)
        Positioned(right: 16, top: 40, child: rightCard),
        // Main preview card (front)
        Center(child: mainCard),
      ],
    );
  }
}

// ── Feature row ───────────────────────────────────────────────────────────────

class _FeatureRow extends StatelessWidget {
  const _FeatureRow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 0),
      child: Row(
        children: [
          const Expanded(
            child: _FeatureItem(number: '01', label: 'Watch real\nvideos'),
          ),
          Container(
            width: 1,
            height: 32,
            color: Colors.white.withValues(alpha: 0.08),
          ),
          const Expanded(
            child: _FeatureItem(number: '02', label: 'Tap to learn\nwords'),
          ),
          Container(
            width: 1,
            height: 32,
            color: Colors.white.withValues(alpha: 0.08),
          ),
          const Expanded(
            child: _FeatureItem(number: '03', label: 'Track your\nprogress'),
          ),
        ],
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  const _FeatureItem({required this.number, required this.label});

  final String number;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            number,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryLight,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: Colors.white.withValues(alpha: 0.55),
              height: 1.3,
            ),
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}

// ── CTA section ───────────────────────────────────────────────────────────────

class _CTASection extends StatelessWidget {
  const _CTASection({required this.headlineFontSize});

  final double headlineFontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Headline
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Think like\n',
                  style: GoogleFonts.poppins(
                    fontSize: headlineFontSize,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    height: 1.05,
                    letterSpacing: -1.0,
                  ),
                ),
                TextSpan(
                  text: 'a local.',
                  style: GoogleFonts.poppins(
                    fontSize: headlineFontSize,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primaryLight,
                    height: 1.05,
                    letterSpacing: -1.0,
                  ),
                ),
              ],
            ),
          )
              .animate()
              .fadeIn(delay: 350.ms, duration: 500.ms)
              .slideY(
                begin: 0.12,
                duration: 500.ms,
                delay: 350.ms,
                curve: Curves.easeOutCubic,
              ),

          const SizedBox(height: 12),

          // Subtext
          Text(
            'Real content. Real immersion. Real progress.',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.white.withValues(alpha: 0.45),
              letterSpacing: 0.1,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ).animate().fadeIn(delay: 350.ms, duration: 500.ms),

          const SizedBox(height: 28),

          // Button + sign-in (animated together)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                height: 54,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF7C3AED), Color(0xFF6D28D9)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF7C3AED).withValues(alpha: 0.4),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(14),
                      onTap: () => context.go('/onboarding/language'),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Get started',
                              style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                letterSpacing: 0.2,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.white,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Have an account? ',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: Colors.white.withValues(alpha: 0.35),
                          ),
                        ),
                        TextSpan(
                          text: 'Sign in',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          )
              .animate()
              .fadeIn(delay: 500.ms, duration: 400.ms)
              .slideY(
                begin: 0.1,
                duration: 400.ms,
                delay: 500.ms,
                curve: Curves.easeOutCubic,
              ),
        ],
      ),
    );
  }
}

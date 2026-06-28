import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/screens/home_screen.dart';
import '../../features/home/screens/shell_screen.dart';
import '../../features/onboarding/screens/language_selection_screen.dart';
import '../../features/onboarding/screens/proficiency_level_screen.dart';
import '../../features/onboarding/screens/splash_screen.dart';
import '../../features/onboarding/screens/welcome_screen.dart';
import '../../features/profile/screens/profile_screen.dart';
import '../../features/progress/screens/progress_screen.dart';
import '../../features/settings/screens/settings_screen.dart';
import '../../features/vocabulary/screens/vocabulary_screen.dart';
import '../../features/vocabulary/screens/word_detail_screen.dart';

abstract final class AppRoutes {
  static const splash = '/splash';
  static const welcome = '/welcome';
  static const onboardingLanguage = '/onboarding/language';
  static const onboardingLevel = '/onboarding/level';
  static const shell = '/shell';
  static const home = '/shell/home';
  static const vocabulary = '/shell/vocabulary';
  static const progress = '/shell/progress';
  static const profile = '/shell/profile';
  static const settings = '/settings';
  static const wordDetail = '/vocabulary/:wordId';

  static String wordDetailPath(String wordId) => '/vocabulary/$wordId';
}

final appRouter = GoRouter(
  initialLocation: kIsWeb ? AppRoutes.welcome : AppRoutes.splash,
  debugLogDiagnostics: false,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      name: 'splash',
      builder: (_, __) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.welcome,
      name: 'welcome',
      builder: (_, __) => const WelcomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.onboardingLanguage,
      name: 'onboarding-language',
      builder: (_, __) => const LanguageSelectionScreen(),
    ),
    GoRoute(
      path: AppRoutes.onboardingLevel,
      name: 'onboarding-level',
      builder: (_, __) => const ProficiencyLevelScreen(),
    ),

    // Stateful shell with bottom nav
    StatefulShellRoute.indexedStack(
      builder: (_, __, navigationShell) => ShellScreen(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.home,
              name: 'home',
              builder: (_, __) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.vocabulary,
              name: 'vocabulary',
              builder: (_, __) => const VocabularyScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.progress,
              name: 'progress',
              builder: (_, __) => const ProgressScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.profile,
              name: 'profile',
              builder: (_, __) => const ProfileScreen(),
            ),
          ],
        ),
      ],
    ),

    GoRoute(
      path: AppRoutes.settings,
      name: 'settings',
      pageBuilder: (_, state) => CustomTransitionPage<void>(
        child: const SettingsScreen(),
        transitionDuration: const Duration(milliseconds: 300),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curved = CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCubic,
          );
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(curved),
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      path: AppRoutes.wordDetail,
      name: 'word-detail',
      pageBuilder: (_, state) {
        final wordId = state.pathParameters['wordId']!;
        return CustomTransitionPage<void>(
          child: WordDetailScreen(wordId: wordId),
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final curved = CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutCubic,
            );
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(curved),
              child: child,
            );
          },
        );
      },
    ),
  ],

  redirect: (context, state) async {
    // SplashScreen handles its own redirect after initialization.
    // Additional global guards (e.g. auth) can be added here.
    return null;
  },

  errorBuilder: (_, state) => Scaffold(
    body: Center(
      child: Text('Page not found: ${state.uri}'),
    ),
  ),
);

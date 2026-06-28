import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';

class ShellScreen extends StatelessWidget {
  const ShellScreen({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  static const _destinations = [
    (label: AppStrings.navHome, icon: Icons.home_outlined, selectedIcon: Icons.home_rounded),
    (label: AppStrings.navVocabulary, icon: Icons.menu_book_outlined, selectedIcon: Icons.menu_book_rounded),
    (label: AppStrings.navProgress, icon: Icons.bar_chart_outlined, selectedIcon: Icons.bar_chart_rounded),
    (label: AppStrings.navProfile, icon: Icons.person_outline_rounded, selectedIcon: Icons.person_rounded),
  ];

  void _onTap(int index) => navigationShell.goBranch(
        index,
        initialLocation: index == navigationShell.currentIndex,
      );

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= 600;

    if (isWide) {
      return Scaffold(
        backgroundColor: AppColors.background,
        body: Row(
          children: [
            _SideRail(
              currentIndex: navigationShell.currentIndex,
              onTap: _onTap,
            ),
            const VerticalDivider(
              width: 1,
              thickness: 1,
              color: AppColors.border,
            ),
            Expanded(child: navigationShell),
          ],
        ),
      );
    }

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: _BottomNav(
        currentIndex: navigationShell.currentIndex,
        onTap: _onTap,
      ),
    );
  }
}

// ── Side rail (tablet / desktop) ──────────────────────────────────────────────

class _SideRail extends StatelessWidget {
  const _SideRail({required this.currentIndex, required this.onTap});

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      backgroundColor: AppColors.surface,
      labelType: NavigationRailLabelType.all,
      selectedIconTheme: const IconThemeData(color: AppColors.primaryLight),
      selectedLabelTextStyle: const TextStyle(color: AppColors.primaryLight),
      unselectedIconTheme: const IconThemeData(color: AppColors.onSurfaceMuted),
      unselectedLabelTextStyle: const TextStyle(color: AppColors.onSurfaceMuted),
      destinations: ShellScreen._destinations
          .map(
            (d) => NavigationRailDestination(
              icon: Icon(d.icon),
              selectedIcon: Icon(d.selectedIcon),
              label: Text(d.label),
            ),
          )
          .toList(),
    );
  }
}

// ── Bottom nav (phone) ────────────────────────────────────────────────────────

class _BottomNav extends StatelessWidget {
  const _BottomNav({required this.currentIndex, required this.onTap});

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border)),
        color: Colors.transparent,
      ),
      child: SafeArea(
        top: false,
        child: NavigationBar(
          selectedIndex: currentIndex,
          onDestinationSelected: onTap,
          backgroundColor: AppColors.surface.withValues(alpha: 0.92),
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          destinations: ShellScreen._destinations
              .map(
                (d) => NavigationDestination(
                  icon: Icon(d.icon),
                  selectedIcon: Icon(d.selectedIcon),
                  label: d.label,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

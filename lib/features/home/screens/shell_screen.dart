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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: _BottomNav(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
      ),
    );
  }
}

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

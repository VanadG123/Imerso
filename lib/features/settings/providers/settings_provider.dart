import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_provider.g.dart';

class SettingsState {
  final int dailyGoalMinutes;
  final bool notificationsEnabled;
  final bool difficultyAutoAdjust;
  final String textSize;

  const SettingsState({
    this.dailyGoalMinutes = 30,
    this.notificationsEnabled = true,
    this.difficultyAutoAdjust = true,
    this.textSize = 'medium',
  });

  SettingsState copyWith({
    int? dailyGoalMinutes,
    bool? notificationsEnabled,
    bool? difficultyAutoAdjust,
    String? textSize,
  }) =>
      SettingsState(
        dailyGoalMinutes: dailyGoalMinutes ?? this.dailyGoalMinutes,
        notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
        difficultyAutoAdjust: difficultyAutoAdjust ?? this.difficultyAutoAdjust,
        textSize: textSize ?? this.textSize,
      );
}

@riverpod
class SettingsNotifier extends _$SettingsNotifier {
  @override
  SettingsState build() {
    _loadFromPrefs();
    return const SettingsState();
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    state = SettingsState(
      dailyGoalMinutes: prefs.getInt('daily_goal') ?? 30,
      notificationsEnabled: prefs.getBool('notifications') ?? true,
      difficultyAutoAdjust: prefs.getBool('difficulty_auto') ?? true,
      textSize: prefs.getString('text_size') ?? 'medium',
    );
  }

  Future<void> setDailyGoal(int minutes) async {
    if (![15, 30, 45, 60].contains(minutes)) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('daily_goal', minutes);
    state = state.copyWith(dailyGoalMinutes: minutes);
  }

  Future<void> toggleNotifications() async {
    final next = !state.notificationsEnabled;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notifications', next);
    state = state.copyWith(notificationsEnabled: next);
  }

  Future<void> toggleDifficultyAdjust() async {
    final next = !state.difficultyAutoAdjust;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('difficulty_auto', next);
    state = state.copyWith(difficultyAutoAdjust: next);
  }

  Future<void> setTextSize(String size) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('text_size', size);
    state = state.copyWith(textSize: size);
  }

  Future<void> resetOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    if (context.mounted) context.go('/welcome');
  }
}

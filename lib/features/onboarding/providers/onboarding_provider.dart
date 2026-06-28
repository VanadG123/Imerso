import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/language_model.dart';

part 'onboarding_provider.freezed.dart';
part 'onboarding_provider.g.dart';

// ── Shared Prefs Keys ────────────────────────────────────────────────────────
abstract final class OnboardingKeys {
  static const String done = 'onboarding_done';
  static const String nativeLanguage = 'native_language';
  static const String targetLanguage = 'target_language';
  static const String proficiencyLevel = 'proficiency_level';
}

// ── State ────────────────────────────────────────────────────────────────────
@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    Language? nativeLanguage,
    Language? targetLanguage,
    ProficiencyLevel? proficiencyLevel,
    @Default(0) int currentStep,
    @Default(false) bool isSaving,
  }) = _OnboardingState;
}

// ── Notifier ─────────────────────────────────────────────────────────────────
@riverpod
class OnboardingNotifier extends _$OnboardingNotifier {
  @override
  OnboardingState build() => const OnboardingState();

  void selectNativeLanguage(Language language) {
    state = state.copyWith(
      nativeLanguage: language,
      // Clear target if it matches the new native choice
      targetLanguage:
          state.targetLanguage?.code == language.code ? null : state.targetLanguage,
    );
  }

  void selectTargetLanguage(Language language) {
    state = state.copyWith(targetLanguage: language);
  }

  void selectProficiencyLevel(ProficiencyLevel level) {
    state = state.copyWith(proficiencyLevel: level);
  }

  void goToStep(int step) {
    state = state.copyWith(currentStep: step);
  }

  Future<void> completeOnboarding() async {
    state = state.copyWith(isSaving: true);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        OnboardingKeys.nativeLanguage, state.nativeLanguage?.code ?? '');
    await prefs.setString(
        OnboardingKeys.targetLanguage, state.targetLanguage?.code ?? '');
    await prefs.setString(
        OnboardingKeys.proficiencyLevel, state.proficiencyLevel?.code ?? '');
    await prefs.setBool(OnboardingKeys.done, true);
    state = state.copyWith(isSaving: false);
  }
}

import '../models/language_model.dart';

abstract final class MockLanguages {
  static const List<Language> all = [
    Language(code: 'en', name: 'English',    flag: '🇬🇧', nativeName: 'English'),
    Language(code: 'es', name: 'Spanish',    flag: '🇪🇸', nativeName: 'Español'),
    Language(code: 'ja', name: 'Japanese',   flag: '🇯🇵', nativeName: '日本語'),
    Language(code: 'fr', name: 'French',     flag: '🇫🇷', nativeName: 'Français'),
    Language(code: 'de', name: 'German',     flag: '🇩🇪', nativeName: 'Deutsch'),
    Language(code: 'ko', name: 'Korean',     flag: '🇰🇷', nativeName: '한국어'),
    Language(code: 'it', name: 'Italian',    flag: '🇮🇹', nativeName: 'Italiano'),
    Language(code: 'pt', name: 'Portuguese', flag: '🇵🇹', nativeName: 'Português'),
    Language(code: 'zh', name: 'Mandarin',   flag: '🇨🇳', nativeName: '普通话'),
    Language(code: 'ru', name: 'Russian',    flag: '🇷🇺', nativeName: 'Русский'),
    Language(code: 'ar', name: 'Arabic',     flag: '🇸🇦', nativeName: 'العربية'),
    Language(code: 'hi', name: 'Hindi',      flag: '🇮🇳', nativeName: 'हिन्दी'),
  ];

  static const List<ProficiencyLevel> levels = [
    ProficiencyLevel(
      code: 'A1',
      name: 'Beginner',
      description: 'I know basic words and a few phrases',
      numericLevel: 1,
    ),
    ProficiencyLevel(
      code: 'A2',
      name: 'Elementary',
      description: 'I can handle simple conversations',
      numericLevel: 2,
    ),
    ProficiencyLevel(
      code: 'B1',
      name: 'Intermediate',
      description: 'I can discuss familiar topics with ease',
      numericLevel: 3,
    ),
    ProficiencyLevel(
      code: 'B2',
      name: 'Upper Intermediate',
      description: 'I understand complex texts and speak fluently',
      numericLevel: 4,
    ),
    ProficiencyLevel(
      code: 'C1',
      name: 'Advanced',
      description: 'I express myself spontaneously and precisely',
      numericLevel: 5,
    ),
  ];
}

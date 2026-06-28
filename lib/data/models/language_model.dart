import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_model.freezed.dart';
part 'language_model.g.dart';

@freezed
class Language with _$Language {
  const factory Language({
    required String code,
    required String name,
    required String flag,
    required String nativeName,
  }) = _Language;

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);
}

@freezed
class ProficiencyLevel with _$ProficiencyLevel {
  const factory ProficiencyLevel({
    required String code,
    required String name,
    required String description,
    required int numericLevel,
  }) = _ProficiencyLevel;

  factory ProficiencyLevel.fromJson(Map<String, dynamic> json) =>
      _$ProficiencyLevelFromJson(json);
}

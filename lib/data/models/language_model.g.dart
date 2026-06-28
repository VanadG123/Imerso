// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LanguageImpl _$$LanguageImplFromJson(Map<String, dynamic> json) =>
    _$LanguageImpl(
      code: json['code'] as String,
      name: json['name'] as String,
      flag: json['flag'] as String,
      nativeName: json['nativeName'] as String,
    );

Map<String, dynamic> _$$LanguageImplToJson(_$LanguageImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'flag': instance.flag,
      'nativeName': instance.nativeName,
    };

_$ProficiencyLevelImpl _$$ProficiencyLevelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProficiencyLevelImpl(
      code: json['code'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      numericLevel: (json['numericLevel'] as num).toInt(),
    );

Map<String, dynamic> _$$ProficiencyLevelImplToJson(
        _$ProficiencyLevelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
      'numericLevel': instance.numericLevel,
    };

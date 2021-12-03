// GENERATED CODE - DO NOT MODIFY BY HAND

part of brand;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Brand _$BrandFromJson(Map<String, dynamic> json) => Brand()
  ..id = json['id'] as int?
  ..slug = json['slug'] as String?
  ..name = json['name'] as String?
  ..translations = (json['translations'] as List<dynamic>?)
      ?.map((e) => Translations.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$BrandToJson(Brand instance) => <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'name': instance.name,
      'translations': instance.translations,
    };

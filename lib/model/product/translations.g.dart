// GENERATED CODE - DO NOT MODIFY BY HAND

part of translations;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Translations _$TranslationsFromJson(Map<String, dynamic> json) => Translations()
  ..id = json['id'] as int?
  ..product_id = json['product_id'] as int?
  ..locale = json['locale'] as String?
  ..name = json['name'] as String?
  ..description = json['description'] as String?
  ..short_description = json['short_description'];

Map<String, dynamic> _$TranslationsToJson(Translations instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.product_id,
      'locale': instance.locale,
      'name': instance.name,
      'description': instance.description,
      'short_description': instance.short_description,
    };

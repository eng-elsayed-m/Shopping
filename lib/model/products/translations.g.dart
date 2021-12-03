// GENERATED CODE - DO NOT MODIFY BY HAND

part of translations;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Translations _$TranslationsFromJson(Map<String, dynamic> json) => Translations()
  ..id = json['id'] as int?
  ..product_id = json['product_id'] as int?
  ..locale = json['locale'] as String?
  ..name = json['name'] as String?;

Map<String, dynamic> _$TranslationsToJson(Translations instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.product_id,
      'locale': instance.locale,
      'name': instance.name,
    };

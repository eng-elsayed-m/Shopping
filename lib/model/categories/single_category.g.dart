// GENERATED CODE - DO NOT MODIFY BY HAND

part of single_category;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleCategory _$SingleCategoryFromJson(Map<String, dynamic> json) =>
    SingleCategory()
      ..id = json['id'] as int?
      ..parent_id = json['parent_id'] as int?
      ..slug = json['slug'] as String?
      ..name = json['name'] as String?
      ..position = json['position'] as int?
      ..is_searchable = json['is_searchable'] as bool?
      ..translations = (json['translations'] as List<dynamic>?)
          ?.map((e) => Translations.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SingleCategoryToJson(SingleCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parent_id': instance.parent_id,
      'slug': instance.slug,
      'name': instance.name,
      'position': instance.position,
      'is_searchable': instance.is_searchable,
      'translations': instance.translations,
    };

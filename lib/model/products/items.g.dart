// GENERATED CODE - DO NOT MODIFY BY HAND

part of items;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Items _$ItemsFromJson(Map<String, dynamic> json) => Items()
  ..id = json['id'] as int?
  ..parent_id = json['parent_id'] as int?
  ..slug = json['slug'] as String?
  ..position = json['position'] as int?
  ..is_searchable = json['is_searchable'] as bool?
  ..is_active = json['is_active'] as bool?
  ..created_at = json['created_at'] as String?
  ..updated_at = json['updated_at'] as String?
  ..items = (json['items'] as List<dynamic>?)?.map((e) => e as Object).toList()
  ..name = json['name'] as String?
  ..files = (json['files'] as List<dynamic>?)?.map((e) => e as Object).toList()
  ..logo = json['logo'] == null
      ? null
      : Logo.fromJson(json['logo'] as Map<String, dynamic>)
  ..banner = json['banner'] == null
      ? null
      : Banner.fromJson(json['banner'] as Map<String, dynamic>);

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'id': instance.id,
      'parent_id': instance.parent_id,
      'slug': instance.slug,
      'position': instance.position,
      'is_searchable': instance.is_searchable,
      'is_active': instance.is_active,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'items': instance.items,
      'name': instance.name,
      'files': instance.files,
      'logo': instance.logo,
      'banner': instance.banner,
    };

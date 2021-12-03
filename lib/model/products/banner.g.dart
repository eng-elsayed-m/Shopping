// GENERATED CODE - DO NOT MODIFY BY HAND

part of banner;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banner _$BannerFromJson(Map<String, dynamic> json) => Banner()
  ..id = json['id']
  ..path = json['path']
  ..exists = json['exists'] as bool?;

Map<String, dynamic> _$BannerToJson(Banner instance) => <String, dynamic>{
      'id': instance.id,
      'path': instance.path,
      'exists': instance.exists,
    };

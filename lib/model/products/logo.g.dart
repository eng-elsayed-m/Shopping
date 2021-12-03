// GENERATED CODE - DO NOT MODIFY BY HAND

part of logo;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Logo _$LogoFromJson(Map<String, dynamic> json) => Logo()
  ..id = json['id']
  ..path = json['path']
  ..exists = json['exists'] as bool?;

Map<String, dynamic> _$LogoToJson(Logo instance) => <String, dynamic>{
      'id': instance.id,
      'path': instance.path,
      'exists': instance.exists,
    };

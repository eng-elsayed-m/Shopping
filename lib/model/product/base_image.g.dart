// GENERATED CODE - DO NOT MODIFY BY HAND

part of base_image;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Base_image _$Base_imageFromJson(Map<String, dynamic> json) => Base_image()
  ..id = json['id'] as int?
  ..filename = json['filename'] as String?
  ..path = json['path'] as String?;

Map<String, dynamic> _$Base_imageToJson(Base_image instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filename': instance.filename,
      'path': instance.path,
    };

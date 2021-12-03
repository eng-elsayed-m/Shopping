// GENERATED CODE - DO NOT MODIFY BY HAND

part of images;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Images _$ImagesFromJson(Map<String, dynamic> json) => Images()
  ..id = json['id'] as int?
  ..filename = json['filename'] as String?
  ..path = json['path'] as String?;

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'id': instance.id,
      'filename': instance.filename,
      'path': instance.path,
    };

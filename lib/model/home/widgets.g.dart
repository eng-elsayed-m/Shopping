// GENERATED CODE - DO NOT MODIFY BY HAND

part of widgets;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Widgets _$WidgetsFromJson(Map<String, dynamic> json) => Widgets()
  ..id = json['id'] as int?
  ..templateId = json['templateId'] as int?
  ..name = json['name'] as String?
  ..type = json['type'] as String?
  ..data = (json['data'] as List<dynamic>?)
      ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
      .toList()
  ..position = json['position'] as int?
  ..inApp = json['inApp'] as bool?
  ..inWeb = json['inWeb'] as bool?
  ..isActive = json['isActive'] as bool?
  ..createdAt = json['createdAt'] as String?
  ..updatedAt = json['updatedAt'] as String?;

Map<String, dynamic> _$WidgetsToJson(Widgets instance) => <String, dynamic>{
      'id': instance.id,
      'templateId': instance.templateId,
      'name': instance.name,
      'type': instance.type,
      'data': instance.data,
      'position': instance.position,
      'inApp': instance.inApp,
      'inWeb': instance.inWeb,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

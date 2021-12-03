// GENERATED CODE - DO NOT MODIFY BY HAND

part of home_response;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) => HomeResponse()
  ..hasWidgets = json['hasWidgets'] as bool?
  ..hasSections = json['hasSections'] as bool?
  ..widgets = (json['widgets'] as List<dynamic>?)
      ?.map((e) => Widgets.fromJson(e as Map<String, dynamic>))
      .toList()
  ..sections =
      (json['sections'] as List<dynamic>?)?.map((e) => e as Object).toList();

Map<String, dynamic> _$HomeResponseToJson(HomeResponse instance) =>
    <String, dynamic>{
      'hasWidgets': instance.hasWidgets,
      'hasSections': instance.hasSections,
      'widgets': instance.widgets,
      'sections': instance.sections,
    };

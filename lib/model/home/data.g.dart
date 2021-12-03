// GENERATED CODE - DO NOT MODIFY BY HAND

part of data;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data()
  ..fileId = json['fileId'] as String?
  ..filePath = json['filePath'] as String?
  ..linkType = json['linkType'] as String?
  ..externalLink = json['externalLink']
  ..title = json['title']
  ..content = json['content']
  ..linkWithAProduct = json['linkWithAProduct'] as String?
  ..linkWithACategory = json['linkWithACategory'] as String?
  ..url = json['url'] as String?;

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'fileId': instance.fileId,
      'filePath': instance.filePath,
      'linkType': instance.linkType,
      'externalLink': instance.externalLink,
      'title': instance.title,
      'content': instance.content,
      'linkWithAProduct': instance.linkWithAProduct,
      'linkWithACategory': instance.linkWithACategory,
      'url': instance.url,
    };

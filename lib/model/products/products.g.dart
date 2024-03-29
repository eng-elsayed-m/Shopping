// GENERATED CODE - DO NOT MODIFY BY HAND

part of products;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Products _$ProductsFromJson(Map<String, dynamic> json) => Products()
  ..current_page = json['current_page'] as int?
  ..data = (json['data'] as List<dynamic>?)
      ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
      .toList()
  ..first_page_url = json['first_page_url'] as String?
  ..from = json['from'] as int?
  ..last_page = json['last_page'] as int?
  ..last_page_url = json['last_page_url'] as String?
  ..links = (json['links'] as List<dynamic>?)
      ?.map((e) => Links.fromJson(e as Map<String, dynamic>))
      .toList()
  ..next_page_url = json['next_page_url']
  ..path = json['path'] as String?
  ..per_page = json['per_page'] as int?
  ..prev_page_url = json['prev_page_url']
  ..to = json['to'] as int?
  ..total = json['total'] as int?;

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'current_page': instance.current_page,
      'data': instance.data,
      'first_page_url': instance.first_page_url,
      'from': instance.from,
      'last_page': instance.last_page,
      'last_page_url': instance.last_page_url,
      'links': instance.links,
      'next_page_url': instance.next_page_url,
      'path': instance.path,
      'per_page': instance.per_page,
      'prev_page_url': instance.prev_page_url,
      'to': instance.to,
      'total': instance.total,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of review;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review()
  ..count = json['count'] as int?
  ..avg_rating = json['avg_rating'] as int?
  ..rating_percent = json['rating_percent'] as int?;

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'count': instance.count,
      'avg_rating': instance.avg_rating,
      'rating_percent': instance.rating_percent,
    };

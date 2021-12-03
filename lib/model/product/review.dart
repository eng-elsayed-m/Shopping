library review;

import 'package:json_annotation/json_annotation.dart';

part 'review.g.dart';

@JsonSerializable()
class Review {
  int? count;
  int? avg_rating;
  int? rating_percent;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);

  static const fromJsonFactory = _$ReviewFromJson;

  Review();

  @override
  String toString() {
    return 'Review{count: $count, avg_rating: $avg_rating, rating_percent: $rating_percent}';
  }
}

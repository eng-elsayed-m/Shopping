library banner;

import 'package:json_annotation/json_annotation.dart';

part 'banner.g.dart';

@JsonSerializable()
class Banner {
  Object? id;
  Object? path;
  bool? exists;

  factory Banner.fromJson(Map<String, dynamic> json) => _$BannerFromJson(json);

  Map<String, dynamic> toJson() => _$BannerToJson(this);

  static const fromJsonFactory = _$BannerFromJson;

  Banner();

  @override
  String toString() {
    return 'Banner{id: $id, path: $path, exists: $exists}';
  }
}

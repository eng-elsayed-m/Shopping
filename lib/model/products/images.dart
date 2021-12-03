library images;

import 'package:json_annotation/json_annotation.dart';

part 'images.g.dart';

@JsonSerializable()
class Images {
  int? id;
  String? filename;
  String? path;

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);

  static const fromJsonFactory = _$ImagesFromJson;

  Images();

  @override
  String toString() {
    return 'Images{id: $id, filename: $filename, path: $path}';
  }
}

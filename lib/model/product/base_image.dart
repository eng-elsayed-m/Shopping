library base_image;

import 'package:json_annotation/json_annotation.dart';

part 'base_image.g.dart';

@JsonSerializable()
class Base_image {
  int? id;
  String? filename;
  String? path;

  factory Base_image.fromJson(Map<String, dynamic> json) =>
      _$Base_imageFromJson(json);

  Map<String, dynamic> toJson() => _$Base_imageToJson(this);

  static const fromJsonFactory = _$Base_imageFromJson;

  Base_image();

  @override
  String toString() {
    return 'Base_image{id: $id, filename: $filename, path: $path}';
  }
}

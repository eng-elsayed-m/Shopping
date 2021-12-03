library data;

import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? fileId;
  String? filePath;
  String? linkType;
  Object? externalLink;
  Object? title;
  Object? content;
  String? linkWithAProduct;
  String? linkWithACategory;
  String? url;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  static const fromJsonFactory = _$DataFromJson;

  Data();

  @override
  String toString() {
    return 'Data{file_id: $fileId, file_path: $filePath, link_type: $linkType, external_link: $externalLink, title: $title, content: $content, link_with_a_product: $linkWithAProduct, link_with_a_category: $linkWithACategory, url: $url}';
  }
}

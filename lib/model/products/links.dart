library links;

import 'package:json_annotation/json_annotation.dart';

part 'links.g.dart';

@JsonSerializable()
class Links {
  Object? url;
  String? label;
  bool? active;

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);

  static const fromJsonFactory = _$LinksFromJson;

  Links();

  @override
  String toString() {
    return 'Links{url: $url, label: $label, active: $active}';
  }
}

library logo;

import 'package:json_annotation/json_annotation.dart';

part 'logo.g.dart';

@JsonSerializable()
class Logo {
  Object? id;
  Object? path;
  bool? exists;

  factory Logo.fromJson(Map<String, dynamic> json) => _$LogoFromJson(json);

  Map<String, dynamic> toJson() => _$LogoToJson(this);

  static const fromJsonFactory = _$LogoFromJson;

  Logo();

  @override
  String toString() {
    return 'Logo{id: $id, path: $path, exists: $exists}';
  }
}

library files;

import 'package:json_annotation/json_annotation.dart';

part 'files.g.dart';

@JsonSerializable()
class Files {
  int? id;
  String? filename;
  String? path;

  factory Files.fromJson(Map<String, dynamic> json) => _$FilesFromJson(json);

  Map<String, dynamic> toJson() => _$FilesToJson(this);

  static const fromJsonFactory = _$FilesFromJson;

  Files();

  @override
  String toString() {
    return 'Files{id: $id, filename: $filename, path: $path}';
  }
}

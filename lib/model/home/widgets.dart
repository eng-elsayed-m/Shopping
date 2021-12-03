library widgets;

import 'package:rzq_customer/model/home/data.dart';

import 'package:json_annotation/json_annotation.dart';

part 'widgets.g.dart';

@JsonSerializable()
class Widgets {
  int? id;
  int? templateId;
  String? name;
  String? type;
  List<Data>? data;
  int? position;
  bool? inApp;
  bool? inWeb;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  factory Widgets.fromJson(Map<String, dynamic> json) =>
      _$WidgetsFromJson(json);

  Map<String, dynamic> toJson() => _$WidgetsToJson(this);

  static const fromJsonFactory = _$WidgetsFromJson;

  Widgets();

  @override
  String toString() {
    return 'Widgets{id: $id, template_id: $templateId, name: $name, type: $type, data: $data, position: $position, in_app: $inApp, in_web: $inWeb, is_active: $isActive, created_at: $createdAt, updated_at: $updatedAt}';
  }
}

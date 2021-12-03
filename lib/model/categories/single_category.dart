library single_category;

import 'package:rzq_customer/model/categories/translations.dart';

import 'package:json_annotation/json_annotation.dart';

part 'single_category.g.dart';

@JsonSerializable()
class SingleCategory {
  int? id;
  int? parent_id;
  String? slug;
  String? name;
  int? position;
  bool? is_searchable;
  List<Translations>? translations;

  factory SingleCategory.fromJson(Map<String, dynamic> json) =>
      _$SingleCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$SingleCategoryToJson(this);

  static const fromJsonFactory = _$SingleCategoryFromJson;

  SingleCategory();

  @override
  String toString() {
    return 'SingleCategory{id: $id, parent_id: $parent_id, slug: $slug, name: $name, position: $position, is_searchable: $is_searchable, translations: $translations}';
  }
}

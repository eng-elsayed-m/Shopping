library categories;

import 'package:rzq_customer/model/products/items.dart';
import 'package:rzq_customer/model/products/logo.dart';
import 'package:rzq_customer/model/products/banner.dart';

import 'package:json_annotation/json_annotation.dart';

part 'categories.g.dart';

@JsonSerializable()
class Categories {
  int? id;
  Object? parent_id;
  String? slug;
  int? position;
  bool? is_searchable;
  bool? is_active;
  String? created_at;
  String? updated_at;
  List<Items>? items;
  String? name;
  List<Object>? files;
  Logo? logo;
  Banner? banner;

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesToJson(this);

  static const fromJsonFactory = _$CategoriesFromJson;

  Categories();

  @override
  String toString() {
    return 'Categories{id: $id, parent_id: $parent_id, slug: $slug, position: $position, is_searchable: $is_searchable, is_active: $is_active, created_at: $created_at, updated_at: $updated_at, items: $items, name: $name, files: $files, logo: $logo, banner: $banner}';
  }
}

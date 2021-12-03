library items;

import 'package:rzq_customer/model/products/logo.dart';
import 'package:rzq_customer/model/products/banner.dart';

import 'package:json_annotation/json_annotation.dart';

part 'items.g.dart';

@JsonSerializable()
class Items {
  int? id;
  int? parent_id;
  String? slug;
  int? position;
  bool? is_searchable;
  bool? is_active;
  String? created_at;
  String? updated_at;
  List<Object>? items;
  String? name;
  List<Object>? files;
  Logo? logo;
  Banner? banner;

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);

  static const fromJsonFactory = _$ItemsFromJson;

  Items();

  @override
  String toString() {
    return 'Items{id: $id, parent_id: $parent_id, slug: $slug, position: $position, is_searchable: $is_searchable, is_active: $is_active, created_at: $created_at, updated_at: $updated_at, items: $items, name: $name, files: $files, logo: $logo, banner: $banner}';
  }
}

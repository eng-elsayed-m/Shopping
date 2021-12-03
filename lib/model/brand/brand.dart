library brand;

import 'package:rzq_customer/model/brand/translations.dart';

import 'package:json_annotation/json_annotation.dart';

part 'brand.g.dart';

@JsonSerializable()
class Brand {
  int? id;
  String? slug;
  String? name;
  List<Translations>? translations;

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);

  Map<String, dynamic> toJson() => _$BrandToJson(this);

  static const fromJsonFactory = _$BrandFromJson;

  Brand();

  @override
  String toString() {
    return 'Brand{id: $id, slug: $slug, name: $name, translations: $translations}';
  }
}

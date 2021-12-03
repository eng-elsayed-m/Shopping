library translations;

import 'package:json_annotation/json_annotation.dart';

part 'translations.g.dart';

@JsonSerializable()
class Translations {
  int? id;
  int? product_id;
  String? locale;
  String? name;
  String? description;
  Object? short_description;

  factory Translations.fromJson(Map<String, dynamic> json) =>
      _$TranslationsFromJson(json);

  Map<String, dynamic> toJson() => _$TranslationsToJson(this);

  static const fromJsonFactory = _$TranslationsFromJson;

  Translations();

  @override
  String toString() {
    return 'Translations{id: $id, product_id: $product_id, locale: $locale, name: $name, description: $description, short_description: $short_description}';
  }
}

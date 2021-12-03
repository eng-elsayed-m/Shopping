library translations;

import 'package:json_annotation/json_annotation.dart';

part 'translations.g.dart';

@JsonSerializable()
class Translations {
  String? locale;
  String? name;

  factory Translations.fromJson(Map<String, dynamic> json) =>
      _$TranslationsFromJson(json);

  Map<String, dynamic> toJson() => _$TranslationsToJson(this);

  static const fromJsonFactory = _$TranslationsFromJson;

  Translations();

  @override
  String toString() {
    return 'Translations{locale: $locale, name: $name}';
  }
}

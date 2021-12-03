library in_current_currency;

import 'package:json_annotation/json_annotation.dart';

part 'in_current_currency.g.dart';

@JsonSerializable()
class InCurrentCurrency {
  int? amount;
  String? formatted;
  String? currency;

  factory InCurrentCurrency.fromJson(Map<String, dynamic> json) =>
      _$InCurrentCurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$InCurrentCurrencyToJson(this);

  static const fromJsonFactory = _$InCurrentCurrencyFromJson;

  InCurrentCurrency();

  @override
  String toString() {
    return 'InCurrentCurrency{amount: $amount, formatted: $formatted, currency: $currency}';
  }
}

library price;

import 'package:rzq_customer/model/products/in_current_currency.dart';

import 'package:json_annotation/json_annotation.dart';

part 'price.g.dart';

@JsonSerializable()
class Price {
  String? amount;
  String? formatted;
  String? currency;
  InCurrentCurrency? inCurrentCurrency;

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  Map<String, dynamic> toJson() => _$PriceToJson(this);

  static const fromJsonFactory = _$PriceFromJson;

  Price();

  @override
  String toString() {
    return 'Price{amount: $amount, formatted: $formatted, currency: $currency, inCurrentCurrency: $inCurrentCurrency}';
  }
}

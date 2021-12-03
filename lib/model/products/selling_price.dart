library selling_price;

import 'package:rzq_customer/model/products/in_current_currency.dart';

import 'package:json_annotation/json_annotation.dart';

part 'selling_price.g.dart';

@JsonSerializable()
class Selling_price {
  String? amount;
  String? formatted;
  String? currency;
  InCurrentCurrency? inCurrentCurrency;

  factory Selling_price.fromJson(Map<String, dynamic> json) =>
      _$Selling_priceFromJson(json);

  Map<String, dynamic> toJson() => _$Selling_priceToJson(this);

  static const fromJsonFactory = _$Selling_priceFromJson;

  Selling_price();

  @override
  String toString() {
    return 'Selling_price{amount: $amount, formatted: $formatted, currency: $currency, inCurrentCurrency: $inCurrentCurrency}';
  }
}

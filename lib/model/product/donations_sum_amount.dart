library donations_sum_amount;

import 'package:rzq_customer/model/product/in_current_currency.dart';

import 'package:json_annotation/json_annotation.dart';

part 'donations_sum_amount.g.dart';

@JsonSerializable()
class Donations_sum_amount {
  Object? amount;
  String? formatted;
  String? currency;
  InCurrentCurrency? inCurrentCurrency;

  factory Donations_sum_amount.fromJson(Map<String, dynamic> json) =>
      _$Donations_sum_amountFromJson(json);

  Map<String, dynamic> toJson() => _$Donations_sum_amountToJson(this);

  static const fromJsonFactory = _$Donations_sum_amountFromJson;

  Donations_sum_amount();

  @override
  String toString() {
    return 'Donations_sum_amount{amount: $amount, formatted: $formatted, currency: $currency, inCurrentCurrency: $inCurrentCurrency}';
  }
}

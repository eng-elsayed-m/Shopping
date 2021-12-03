// GENERATED CODE - DO NOT MODIFY BY HAND

part of donations_sum_amount;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Donations_sum_amount _$Donations_sum_amountFromJson(
        Map<String, dynamic> json) =>
    Donations_sum_amount()
      ..amount = json['amount']
      ..formatted = json['formatted'] as String?
      ..currency = json['currency'] as String?
      ..inCurrentCurrency = json['inCurrentCurrency'] == null
          ? null
          : InCurrentCurrency.fromJson(
              json['inCurrentCurrency'] as Map<String, dynamic>);

Map<String, dynamic> _$Donations_sum_amountToJson(
        Donations_sum_amount instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'formatted': instance.formatted,
      'currency': instance.currency,
      'inCurrentCurrency': instance.inCurrentCurrency,
    };

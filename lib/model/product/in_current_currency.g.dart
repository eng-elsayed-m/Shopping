// GENERATED CODE - DO NOT MODIFY BY HAND

part of in_current_currency;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InCurrentCurrency _$InCurrentCurrencyFromJson(Map<String, dynamic> json) =>
    InCurrentCurrency()
      ..amount = json['amount'] as int?
      ..formatted = json['formatted'] as String?
      ..currency = json['currency'] as String?;

Map<String, dynamic> _$InCurrentCurrencyToJson(InCurrentCurrency instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'formatted': instance.formatted,
      'currency': instance.currency,
    };

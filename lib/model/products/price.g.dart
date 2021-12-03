// GENERATED CODE - DO NOT MODIFY BY HAND

part of price;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Price _$PriceFromJson(Map<String, dynamic> json) => Price()
  ..amount = json['amount'] as String?
  ..formatted = json['formatted'] as String?
  ..currency = json['currency'] as String?
  ..inCurrentCurrency = json['inCurrentCurrency'] == null
      ? null
      : InCurrentCurrency.fromJson(
          json['inCurrentCurrency'] as Map<String, dynamic>);

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'amount': instance.amount,
      'formatted': instance.formatted,
      'currency': instance.currency,
      'inCurrentCurrency': instance.inCurrentCurrency,
    };

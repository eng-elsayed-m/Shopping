// GENERATED CODE - DO NOT MODIFY BY HAND

part of selling_price;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Selling_price _$Selling_priceFromJson(Map<String, dynamic> json) =>
    Selling_price()
      ..amount = json['amount'] as String?
      ..formatted = json['formatted'] as String?
      ..currency = json['currency'] as String?
      ..inCurrentCurrency = json['inCurrentCurrency'] == null
          ? null
          : InCurrentCurrency.fromJson(
              json['inCurrentCurrency'] as Map<String, dynamic>);

Map<String, dynamic> _$Selling_priceToJson(Selling_price instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'formatted': instance.formatted,
      'currency': instance.currency,
      'inCurrentCurrency': instance.inCurrentCurrency,
    };

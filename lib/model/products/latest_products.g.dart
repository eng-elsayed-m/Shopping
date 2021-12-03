// GENERATED CODE - DO NOT MODIFY BY HAND

part of latest_products;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatestProducts _$LatestProductsFromJson(Map<String, dynamic> json) =>
    LatestProducts()
      ..price = json['price'] == null
          ? null
          : Price.fromJson(json['price'] as Map<String, dynamic>)
      ..special_price = json['special_price']
      ..special_price_type = json['special_price_type'] as String?
      ..selling_price = json['selling_price'] == null
          ? null
          : Selling_price.fromJson(
              json['selling_price'] as Map<String, dynamic>)
      ..special_price_start = json['special_price_start']
      ..special_price_end = json['special_price_end']
      ..donations_sum_amount = json['donations_sum_amount'] == null
          ? null
          : Donations_sum_amount.fromJson(
              json['donations_sum_amount'] as Map<String, dynamic>)
      ..options_count = json['options_count'] as int?
      ..id = json['id'] as int?
      ..slug = json['slug'] as String?
      ..manage_stock = json['manage_stock'] as bool?
      ..qty = json['qty']
      ..new_from = json['new_from']
      ..new_to = json['new_to']
      ..type = json['type'] as String?
      ..images =
          (json['images'] as List<dynamic>?)?.map((e) => e as Object).toList()
      ..formatted_price = json['formatted_price'] as String?
      ..rating_percent = json['rating_percent'] as int?
      ..is_in_stock = json['is_in_stock'] as bool?
      ..is_out_of_stock = json['is_out_of_stock'] as bool?
      ..is_new = json['is_new'] as bool?
      ..has_percentage_special_price =
          json['has_percentage_special_price'] as bool?
      ..special_price_percent = json['special_price_percent']
      ..collected_donations_percent = json['collected_donations_percent']
      ..name = json['name'] as String?
      ..reviews =
          (json['reviews'] as List<dynamic>?)?.map((e) => e as Object).toList();

Map<String, dynamic> _$LatestProductsToJson(LatestProducts instance) =>
    <String, dynamic>{
      'price': instance.price,
      'special_price': instance.special_price,
      'special_price_type': instance.special_price_type,
      'selling_price': instance.selling_price,
      'special_price_start': instance.special_price_start,
      'special_price_end': instance.special_price_end,
      'donations_sum_amount': instance.donations_sum_amount,
      'options_count': instance.options_count,
      'id': instance.id,
      'slug': instance.slug,
      'manage_stock': instance.manage_stock,
      'qty': instance.qty,
      'new_from': instance.new_from,
      'new_to': instance.new_to,
      'type': instance.type,
      'images': instance.images,
      'formatted_price': instance.formatted_price,
      'rating_percent': instance.rating_percent,
      'is_in_stock': instance.is_in_stock,
      'is_out_of_stock': instance.is_out_of_stock,
      'is_new': instance.is_new,
      'has_percentage_special_price': instance.has_percentage_special_price,
      'special_price_percent': instance.special_price_percent,
      'collected_donations_percent': instance.collected_donations_percent,
      'name': instance.name,
      'reviews': instance.reviews,
    };

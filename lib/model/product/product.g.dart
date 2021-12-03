// GENERATED CODE - DO NOT MODIFY BY HAND

part of product;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product()
  ..id = json['id'] as int?
  ..brand_id = json['brand_id']
  ..tax_class_id = json['tax_class_id']
  ..type = json['type'] as String?
  ..weight = json['weight']
  ..slug = json['slug'] as String?
  ..price = json['price'] == null
      ? null
      : Price.fromJson(json['price'] as Map<String, dynamic>)
  ..amount_options = json['amount_options']
  ..cost_price = json['cost_price'] as String?
  ..is_special_price_do = json['is_special_price_do'] as bool?
  ..special_price = json['special_price']
  ..special_price_type = json['special_price_type'] as String?
  ..special_price_start = json['special_price_start']
  ..special_price_end = json['special_price_end']
  ..selling_price = json['selling_price'] == null
      ? null
      : Selling_price.fromJson(json['selling_price'] as Map<String, dynamic>)
  ..sku = json['sku']
  ..manage_stock = json['manage_stock'] as bool?
  ..qty = json['qty']
  ..in_stock = json['in_stock'] as bool?
  ..viewed = json['viewed'] as int?
  ..is_active = json['is_active'] as bool?
  ..virtual = json['virtual'] as bool?
  ..new_from = json['new_from']
  ..new_to = json['new_to']
  ..deleted_at = json['deleted_at']
  ..created_at = json['created_at'] as String?
  ..updated_at = json['updated_at'] as String?
  ..donations_sum_amount = json['donations_sum_amount'] == null
      ? null
      : Donations_sum_amount.fromJson(
          json['donations_sum_amount'] as Map<String, dynamic>)
  ..images = (json['images'] as List<dynamic>?)
      ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
      .toList()
  ..formatted_price = json['formatted_price'] as String?
  ..rating_percent = json['rating_percent'] as int?
  ..is_in_stock = json['is_in_stock'] as bool?
  ..is_out_of_stock = json['is_out_of_stock'] as bool?
  ..is_new = json['is_new'] as bool?
  ..has_percentage_special_price = json['has_percentage_special_price'] as bool?
  ..special_price_percent = json['special_price_percent']
  ..collected_donations_percent = json['collected_donations_percent']
  ..name = json['name'] as String?
  ..description = json['description'] as String?
  ..short_description = json['short_description']
  ..translations = (json['translations'] as List<dynamic>?)
      ?.map((e) => Translations.fromJson(e as Map<String, dynamic>))
      .toList()
  ..categories =
      (json['categories'] as List<dynamic>?)?.map((e) => e as Object).toList()
  ..tags = (json['tags'] as List<dynamic>?)?.map((e) => e as Object).toList()
  ..attributes =
      (json['attributes'] as List<dynamic>?)?.map((e) => e as Object).toList()
  ..options =
      (json['options'] as List<dynamic>?)?.map((e) => e as Object).toList()
  ..files = (json['files'] as List<dynamic>?)
      ?.map((e) => Files.fromJson(e as Map<String, dynamic>))
      .toList()
  ..related_products = (json['related_products'] as List<dynamic>?)
      ?.map((e) => e as Object)
      .toList()
  ..up_sell_products = (json['up_sell_products'] as List<dynamic>?)
      ?.map((e) => e as Object)
      .toList()
  ..reviews =
      (json['reviews'] as List<dynamic>?)?.map((e) => e as Object).toList();

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'brand_id': instance.brand_id,
      'tax_class_id': instance.tax_class_id,
      'type': instance.type,
      'weight': instance.weight,
      'slug': instance.slug,
      'price': instance.price,
      'amount_options': instance.amount_options,
      'cost_price': instance.cost_price,
      'is_special_price_do': instance.is_special_price_do,
      'special_price': instance.special_price,
      'special_price_type': instance.special_price_type,
      'special_price_start': instance.special_price_start,
      'special_price_end': instance.special_price_end,
      'selling_price': instance.selling_price,
      'sku': instance.sku,
      'manage_stock': instance.manage_stock,
      'qty': instance.qty,
      'in_stock': instance.in_stock,
      'viewed': instance.viewed,
      'is_active': instance.is_active,
      'virtual': instance.virtual,
      'new_from': instance.new_from,
      'new_to': instance.new_to,
      'deleted_at': instance.deleted_at,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'donations_sum_amount': instance.donations_sum_amount,
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
      'description': instance.description,
      'short_description': instance.short_description,
      'translations': instance.translations,
      'categories': instance.categories,
      'tags': instance.tags,
      'attributes': instance.attributes,
      'options': instance.options,
      'files': instance.files,
      'related_products': instance.related_products,
      'up_sell_products': instance.up_sell_products,
      'reviews': instance.reviews,
    };

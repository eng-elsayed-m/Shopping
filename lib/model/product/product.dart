library product;

import 'package:rzq_customer/model/product/price.dart';
import 'package:rzq_customer/model/product/selling_price.dart';
import 'package:rzq_customer/model/product/donations_sum_amount.dart';
import 'package:rzq_customer/model/product/images.dart';
import 'package:rzq_customer/model/product/base_image.dart';
import 'package:rzq_customer/model/product/translations.dart';
import 'package:rzq_customer/model/product/files.dart';

import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  int? id;
  Object? brand_id;
  Object? tax_class_id;
  String? type;
  Object? weight;
  String? slug;
  Price? price;
  Object? amount_options;
  String? cost_price;
  bool? is_special_price_do;
  Object? special_price;
  String? special_price_type;
  Object? special_price_start;
  Object? special_price_end;
  Selling_price? selling_price;
  Object? sku;
  bool? manage_stock;
  Object? qty;
  bool? in_stock;
  int? viewed;
  bool? is_active;
  bool? virtual;
  Object? new_from;
  Object? new_to;
  Object? deleted_at;
  String? created_at;
  String? updated_at;
  Donations_sum_amount? donations_sum_amount;
  List<Images>? images;
  // Base_image? base_image;
  String? formatted_price;
  int? rating_percent;
  bool? is_in_stock;
  bool? is_out_of_stock;
  bool? is_new;
  bool? has_percentage_special_price;
  Object? special_price_percent;
  Object? collected_donations_percent;
  String? name;
  String? description;
  Object? short_description;
  List<Translations>? translations;
  List<Object>? categories;
  List<Object>? tags;
  List<Object>? attributes;
  List<Object>? options;
  List<Files>? files;
  List<Object>? related_products;
  List<Object>? up_sell_products;
  List<Object>? reviews;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  static const fromJsonFactory = _$ProductFromJson;

  Product();

  @override
  String toString() {
    return 'Product{id: $id, brand_id: $brand_id, tax_class_id: $tax_class_id, type: $type, weight: $weight, slug: $slug, price: $price, amount_options: $amount_options, cost_price: $cost_price, is_special_price_do: $is_special_price_do, special_price: $special_price, special_price_type: $special_price_type, special_price_start: $special_price_start, special_price_end: $special_price_end, selling_price: $selling_price, sku: $sku, manage_stock: $manage_stock, qty: $qty, in_stock: $in_stock, viewed: $viewed, is_active: $is_active, virtual: $virtual, new_from: $new_from, new_to: $new_to, deleted_at: $deleted_at, created_at: $created_at, updated_at: $updated_at, donations_sum_amount: $donations_sum_amount, images: $images, formatted_price: $formatted_price, rating_percent: $rating_percent, is_in_stock: $is_in_stock, is_out_of_stock: $is_out_of_stock, is_new: $is_new, has_percentage_special_price: $has_percentage_special_price, special_price_percent: $special_price_percent, collected_donations_percent: $collected_donations_percent, name: $name, description: $description, short_description: $short_description, translations: $translations, categories: $categories, tags: $tags, attributes: $attributes, options: $options, files: $files, related_products: $related_products, up_sell_products: $up_sell_products, reviews: $reviews}';
  }
}

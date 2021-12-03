library latest_products;

import 'package:rzq_customer/model/products/price.dart';
import 'package:rzq_customer/model/products/selling_price.dart';
import 'package:rzq_customer/model/products/donations_sum_amount.dart';

import 'package:json_annotation/json_annotation.dart';

part 'latest_products.g.dart';

@JsonSerializable()
class LatestProducts {
  Price? price;
  Object? special_price;
  String? special_price_type;
  Selling_price? selling_price;
  Object? special_price_start;
  Object? special_price_end;
  Donations_sum_amount? donations_sum_amount;
  int? options_count;
  int? id;
  String? slug;
  bool? manage_stock;
  Object? qty;
  Object? new_from;
  Object? new_to;
  String? type;
  List<Object>? images;
  // List<Object>? base_image;
  String? formatted_price;
  int? rating_percent;
  bool? is_in_stock;
  bool? is_out_of_stock;
  bool? is_new;
  bool? has_percentage_special_price;
  Object? special_price_percent;
  Object? collected_donations_percent;
  String? name;
  List<Object>? reviews;

  factory LatestProducts.fromJson(Map<String, dynamic> json) =>
      _$LatestProductsFromJson(json);

  Map<String, dynamic> toJson() => _$LatestProductsToJson(this);

  static const fromJsonFactory = _$LatestProductsFromJson;

  LatestProducts();

  @override
  String toString() {
    return 'LatestProducts{price: $price, special_price: $special_price, special_price_type: $special_price_type, selling_price: $selling_price, special_price_start: $special_price_start, special_price_end: $special_price_end, donations_sum_amount: $donations_sum_amount, options_count: $options_count, id: $id, slug: $slug, manage_stock: $manage_stock, qty: $qty, new_from: $new_from, new_to: $new_to, type: $type, images: $images, formatted_price: $formatted_price, rating_percent: $rating_percent, is_in_stock: $is_in_stock, is_out_of_stock: $is_out_of_stock, is_new: $is_new, has_percentage_special_price: $has_percentage_special_price, special_price_percent: $special_price_percent, collected_donations_percent: $collected_donations_percent, name: $name, reviews: $reviews}';
  }
}

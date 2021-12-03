library products_response;

import 'package:rzq_customer/model/products/products.dart';
import 'package:rzq_customer/model/products/categories.dart';
import 'package:rzq_customer/model/products/latest_products.dart';

import 'package:json_annotation/json_annotation.dart';

part 'products_response.g.dart';

@JsonSerializable()
class ProductsResponse {
  Products? products;
  List<Object>? attributes;
  int? maxPrice;
  List<Categories>? categories;
  List<LatestProducts>? latestProducts;

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);

  static const fromJsonFactory = _$ProductsResponseFromJson;

  ProductsResponse();

  @override
  String toString() {
    return 'ProductsResponse{products: $products, attributes: $attributes, maxPrice: $maxPrice, categories: $categories, latestProducts: $latestProducts}';
  }
}

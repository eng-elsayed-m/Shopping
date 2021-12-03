library product_response;

import 'package:rzq_customer/model/product/product.dart';
import 'package:rzq_customer/model/product/review.dart';

import 'package:json_annotation/json_annotation.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  Product? product;
  List<Object>? relatedProducts;
  List<Object>? upSellProducts;
  Review? review;

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);

  static const fromJsonFactory = _$ProductResponseFromJson;

  ProductResponse();

  @override
  String toString() {
    return 'ProductResponse{product: $product, relatedProducts: $relatedProducts, upSellProducts: $upSellProducts, review: $review}';
  }
}

library products;

import 'package:rzq_customer/model/products/data.dart';
import 'package:rzq_customer/model/products/links.dart';

import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

@JsonSerializable()
class Products {
  int? current_page;
  List<Data>? data;
  String? first_page_url;
  int? from;
  int? last_page;
  String? last_page_url;
  List<Links>? links;
  Object? next_page_url;
  String? path;
  int? per_page;
  Object? prev_page_url;
  int? to;
  int? total;

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsToJson(this);

  static const fromJsonFactory = _$ProductsFromJson;

  Products();

  @override
  String toString() {
    return 'Products{current_page: $current_page, data: $data, first_page_url: $first_page_url, from: $from, last_page: $last_page, last_page_url: $last_page_url, links: $links, next_page_url: $next_page_url, path: $path, per_page: $per_page, prev_page_url: $prev_page_url, to: $to, total: $total}';
  }
}

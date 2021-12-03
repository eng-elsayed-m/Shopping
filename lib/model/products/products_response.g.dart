// GENERATED CODE - DO NOT MODIFY BY HAND

part of products_response;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsResponse _$ProductsResponseFromJson(Map<String, dynamic> json) =>
    ProductsResponse()
      ..products = json['products'] == null
          ? null
          : Products.fromJson(json['products'] as Map<String, dynamic>)
      ..attributes = (json['attributes'] as List<dynamic>?)
          ?.map((e) => e as Object)
          .toList()
      ..maxPrice = json['maxPrice'] as int?
      ..categories = (json['categories'] as List<dynamic>?)
          ?.map((e) => Categories.fromJson(e as Map<String, dynamic>))
          .toList()
      ..latestProducts = (json['latestProducts'] as List<dynamic>?)
          ?.map((e) => LatestProducts.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ProductsResponseToJson(ProductsResponse instance) =>
    <String, dynamic>{
      'products': instance.products,
      'attributes': instance.attributes,
      'maxPrice': instance.maxPrice,
      'categories': instance.categories,
      'latestProducts': instance.latestProducts,
    };

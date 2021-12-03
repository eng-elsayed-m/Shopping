// GENERATED CODE - DO NOT MODIFY BY HAND

part of product_response;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse()
      ..product = json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>)
      ..relatedProducts = (json['relatedProducts'] as List<dynamic>?)
          ?.map((e) => e as Object)
          .toList()
      ..upSellProducts = (json['upSellProducts'] as List<dynamic>?)
          ?.map((e) => e as Object)
          .toList()
      ..review = json['review'] == null
          ? null
          : Review.fromJson(json['review'] as Map<String, dynamic>);

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'product': instance.product,
      'relatedProducts': instance.relatedProducts,
      'upSellProducts': instance.upSellProducts,
      'review': instance.review,
    };

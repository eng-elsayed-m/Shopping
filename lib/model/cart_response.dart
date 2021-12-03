library cart_respone;

import 'package:json_annotation/json_annotation.dart';

part 'cart_response.g.dart';

@JsonSerializable()
class CartResponse {
  String? webview_link;
  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CartResponseToJson(this);
  static const fromJsonFactory = _$CartResponseFromJson;
  CartResponse();
  @override
  String toString() {
    return 'CartResponse{webview_link: $webview_link}';
  }
}

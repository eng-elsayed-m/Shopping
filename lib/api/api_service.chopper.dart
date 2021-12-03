// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$ApiService extends ApiService {
  _$ApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ApiService;

  @override
  Future<Response<User>> login(Map<String, dynamic> body) {
    final $url = 'auth/send-verification-code';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<User, User>($request);
  }

  @override
  Future<Response<dynamic>> register(
      String attemptId, Map<String, dynamic> body) {
    final $url = 'auth/register/$attemptId';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<User>> verify(String attemptId, String verificationCode) {
    final $url = 'auth/verify/$attemptId';
    final $body = <String, dynamic>{'verification_code': verificationCode};
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<User, User>($request);
  }

  @override
  Future<Response<UserData>> editProfile(String token) {
    final $url = 'account/profile';
    final $headers = {
      'Authorization': token,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<UserData, UserData>($request);
  }

  @override
  Future<Response<dynamic>> updateProfile(
      String token, Map<String, dynamic> body) {
    final $url = 'account/profile';
    final $headers = {
      'Authorization': token,
    };

    final $body = body;
    final $request =
        Request('PUT', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<CartResponse>> addToCart(
      String cookie, int product_id, int qty) {
    final $url = 'cart/items';
    final $headers = {
      'Cookie': cookie,
    };

    final $body = <String, dynamic>{'product_id': product_id, 'qty': qty};
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<CartResponse, CartResponse>($request);
  }

  @override
  Future<Response<ProductsResponse>> getProducts() {
    final $url = 'products';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<ProductsResponse, ProductsResponse>($request);
  }

  @override
  Future<Response<List<SingleCategory>>> getCategories() {
    final $url = 'categories';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<SingleCategory>, SingleCategory>($request);
  }

  @override
  Future<Response<List<Brand>>> getBrands() {
    final $url = 'brands';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<Brand>, Brand>($request);
  }

  @override
  Future<Response<ProductResponse>> getProduct(String slug) {
    final $url = 'products/$slug';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<ProductResponse, ProductResponse>($request);
  }
}

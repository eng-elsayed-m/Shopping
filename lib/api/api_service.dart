import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:flutter_toolbox/flutter_toolbox.dart';
import 'package:http/retry.dart';
import 'package:rzq_customer/api/utils.dart';
import 'package:rzq_customer/model/brand/brand.dart';
import 'package:rzq_customer/model/cart_response.dart';
import 'package:rzq_customer/model/categories/single_category.dart';
import 'package:rzq_customer/model/product/product_response.dart';
import 'package:rzq_customer/model/products/products_response.dart';
import 'package:rzq_customer/model/user/user.dart';
import 'package:http/http.dart' as http;
import 'package:rzq_customer/model/user/user_data.dart';

part 'api_service.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  @Post(path: 'auth/send-verification-code')
  Future<Response<User>> login(@Body() Map<String, dynamic> body);

  @Post(path: 'auth/register/{attempt_id}')
  Future<Response> register(
    @Path('attempt_id') String attemptId,
    @Body() Map<String, dynamic> body,
  );

  @Post(path: 'auth/verify/{attempt_id}')
  Future<Response<User>> verify(
    @Path('attempt_id') String attemptId,
    @Field("verification_code") String verificationCode,
  );

  @Get(path: 'account/profile')
  Future<Response<UserData>> editProfile(
    @Header("Authorization") String token,
  );
  @Put(path: 'account/profile')
  Future<Response> updateProfile(
    @Header("Authorization") String token,
    @Body() Map<String, dynamic> body,
  );

  @Post(path: 'cart/items')
  Future<Response<CartResponse>> addToCart(@Header("Cookie") String cookie,
      @Field("product_id") int product_id, @Field("qty") int qty);

  @Get(path: 'products')
  Future<Response<ProductsResponse>> getProducts();

  @Get(path: 'categories')
  Future<Response<List<SingleCategory>>> getCategories();

  @Get(path: 'brands')
  Future<Response<List<Brand>>> getBrands();

  @Get(path: 'products/{slug}')
  Future<Response<ProductResponse>> getProduct(@Path("slug") String slug);

  static ApiService create() {
    final JsonSerializableConverter converter = JsonSerializableConverter({
      User: User.fromJsonFactory,
      UserData: UserData.fromJsonFactory,
      ErrorResponse: ErrorResponse.fromJsonFactory,
      ProductsResponse: ProductsResponse.fromJsonFactory,
      ProductResponse: ProductResponse.fromJsonFactory,
      CartResponse: CartResponse.fromJsonFactory,
      SingleCategory: SingleCategory.fromJsonFactory,
      Brand: Brand.fromJsonFactory,
    });
    final chopperClint = ChopperClient(
        baseUrl: 'https://melestore.rzq.sa/api/v1/',
        services: [
          _$ApiService(),
        ],
        converter: converter,
        errorConverter: converter,
        client: RetryClient(http.Client()),
        interceptors: [
          onRequest,
          loggingInterceptors,
          HttpLoggingInterceptor(),
        ]);

    return _$ApiService(chopperClint);
  }
}

Future<Request> loggingInterceptors(Request request) async {
  print("url = ${request.baseUrl}${request.url}");
  print("request.body = ${request.body}");
  if (request.parts.isNotEmpty)
    print(
        "request.parts = ${request.parts.map((p) => '${p.name} : ${p.value}').toList()}");
  return request;
}

FutureOr<Request> onRequest(Request request) {
  return applyHeaders(
    request,
    {'Content-type': 'application/json', 'Accept': 'application/json'},
  );
}

FutureOr<Request> onRequ(Request request) {
  return applyHeaders(
    request,
    {'Content-type': 'application/json', 'Accept': 'application/json'},
  );
}

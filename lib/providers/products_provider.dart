import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_toolbox/flutter_toolbox.dart';
import 'package:rzq_customer/api/api_service.dart';
import 'package:rzq_customer/model/api/api_response.dart';
import 'package:rzq_customer/model/product/product.dart';
import 'package:rzq_customer/model/product/product_response.dart';
import 'package:rzq_customer/model/products/data.dart';
import 'package:rzq_customer/model/products/products_response.dart';

class ProductsProvider extends ChangeNotifier {
  ApiResponse? _apiResponse = ApiResponse.initial("Empty Data");
  List<Data>? _products;
  List<Data>? get products => _products;
  ApiResponse get response => _apiResponse!;
  Product? _product;
  Product? get product => _product;
  Future fetchProducts() async {
    if (_products != null) return;
    _apiResponse = ApiResponse.loading("loading");
    Response<ProductsResponse>? res;
    res = await ApiService.create().getProducts();
    if (!res.isSuccessful) {
      final erros = res.error as ErrorResponse;
      _apiResponse = ApiResponse.error(erros.error);
      notifyListeners();
      return;
    }
    final resData = res.body!;
    print(res.error);

    _products = resData.products!.data!;
    _apiResponse = ApiResponse.complete("complete");

    notifyListeners();
  }
    Future<void> refreshProducts() async {
      _products = null;
      return fetchProducts();
    }
  Future fetchProduct(String slug) async {
    _apiResponse = ApiResponse.loading("loading");
    Response<ProductResponse>? res;
    res = await ApiService.create().getProduct(slug);
    if (!res.isSuccessful) {
      final erros = res.error as ErrorResponse;
      _apiResponse = ApiResponse.error(erros.error);
      notifyListeners();
      return;
    }
    final resData = res.body!;
    print(res.error);

    _product = resData.product!;
    _apiResponse = ApiResponse.complete("complete");

    notifyListeners();
  }
}

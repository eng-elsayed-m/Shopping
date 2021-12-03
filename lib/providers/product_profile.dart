import 'package:flutter/cupertino.dart';
import 'package:flutter_toolbox/flutter_toolbox.dart';
import 'package:rzq_customer/api/api_service.dart';
import 'package:rzq_customer/model/api/api_response.dart';
import 'package:rzq_customer/model/product/product.dart';

class ProductProvider extends ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial("Empty Data");
  Product? _product;
  ApiResponse get response => _apiResponse;
  Product? get product => _product;

  Future fetchProduct(String slug) async {
    _apiResponse = ApiResponse.loading("loading");
    notifyListeners();
    final res = await ApiService.create().getProduct(slug);
    if (!res.isSuccessful) {
      final erros = res.error as ErrorResponse;
      _apiResponse = ApiResponse.error(erros.error);
      notifyListeners();
      return;
    }
    _product = res.body!.product;
    _apiResponse = ApiResponse.complete("Complete");
    notifyListeners();
  }
}

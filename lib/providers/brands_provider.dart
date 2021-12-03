import 'package:flutter/foundation.dart';
import 'package:flutter_toolbox/flutter_toolbox.dart';
import 'package:rzq_customer/api/api_service.dart';
import 'package:rzq_customer/model/api/api_response.dart';
import 'package:rzq_customer/model/brand/brand.dart';

class BrandsProvider extends ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial("Empty Data");
  List<Brand>? _brands;
  ApiResponse get response => _apiResponse;
  List<Brand>? get brands => _brands;

  Future fetchBrands() async {
    if (_brands != null) return;
    _apiResponse = ApiResponse.loading("loading");
    final res = await ApiService.create().getBrands();
    if (!res.isSuccessful) {
      final erros = res.error as ErrorResponse;
      _apiResponse = ApiResponse.error(erros.error);
      notifyListeners();
      return;
    }
    _brands = res.body;
    _apiResponse = ApiResponse.complete("Complete");
    notifyListeners();
  }
}

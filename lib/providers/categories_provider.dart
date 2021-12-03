import 'package:flutter/foundation.dart';
import 'package:flutter_toolbox/flutter_toolbox.dart';
import 'package:rzq_customer/api/api_service.dart';
import 'package:rzq_customer/model/api/api_response.dart';
import 'package:rzq_customer/model/categories/single_category.dart';

class CategoriesProvier extends ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial("Empty Data");
  List<SingleCategory>? _categories;
  ApiResponse get response => _apiResponse;
  List<SingleCategory>? get categories => _categories;

  Future fetchCategories() async {
    if (_categories != null) return;
    _apiResponse = ApiResponse.loading("loading");
    final res = await ApiService.create().getCategories();
    if (!res.isSuccessful) {
      final erros = res.error as ErrorResponse;
      _apiResponse = ApiResponse.error(erros.error);
      notifyListeners();
      return;
    }
    _categories = res.body;
    _categories!.sort((a, b) => a.position!.compareTo(b.position!));
    _apiResponse = ApiResponse.complete("Complete");
    notifyListeners();
  }
}

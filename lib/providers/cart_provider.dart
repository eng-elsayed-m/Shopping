import 'package:flutter/cupertino.dart';
import 'package:flutter_toolbox/flutter_toolbox.dart';
import 'package:rzq_customer/api/api_service.dart';
import 'package:rzq_customer/model/api/api_response.dart';

class CartProvider extends ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial("Empty Data");
  String? _webLink;
  String? _cookie;

  ApiResponse get response => _apiResponse;
  String? get link => _webLink;

  Future addToCart(int id) async {
    _apiResponse = ApiResponse.loading("loading");
    notifyListeners();
    final res = await ApiService.create().addToCart(_cookie ?? "", id, 1);
    if (!res.isSuccessful) {
      final erros = res.error as ErrorResponse;
      _apiResponse = ApiResponse.error(erros.error);
      notifyListeners();
      return;
    }
    _webLink = res.body!.webview_link!;
    if (_cookie == null) setCoockies(res.headers);
    _apiResponse = ApiResponse.complete(_cookie);
    notifyListeners();
  }

  void setCoockies(Map<String, dynamic> headers) {
    if (headers["set-cookie"] != null)
      _cookie = headers["set-cookie"].toString().split(";").first;
  }
}

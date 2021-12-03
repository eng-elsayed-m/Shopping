import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_toolbox/flutter_toolbox.dart';
import 'package:rzq_customer/api/api_service.dart';
import 'package:rzq_customer/model/api/api_response.dart';
import 'package:rzq_customer/model/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationProvider extends ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial("Empty Date");
  User _user = User();
  String? _expiryDate;
  Timer? _authTimer;
  bool get isAuth => _user.token != null;
  ApiResponse get response => _apiResponse;
  User get user => _user;

  Future login(Map<String, dynamic> body) async {
    _apiResponse = ApiResponse.loading("Logging...");
    notifyListeners();
    final res = await ApiService.create().login(body);
    if (!res.isSuccessful) {
      final errors = res.error as ErrorResponse;
      _apiResponse =
          ApiResponse.error(errors.error!.split("[").last.split("]").first);
    } else {
      final User resData = res.body!;
      _user = resData;
      _apiResponse = ApiResponse.complete(resData.attempt_id);
    }
    notifyListeners();
  }

  Future<bool?> verifyCode(String vCode) async {
    _apiResponse = ApiResponse.loading("verifying ...");
    notifyListeners();
    final res = await ApiService.create().verify(_user.attempt_id!, vCode);
    if (!res.isSuccessful) {
      final errors = res.error as ErrorResponse;
      _apiResponse =
          ApiResponse.error(errors.error!.split("[").last.split("]").first);
      notifyListeners();
    } else {
      final resData = res.body;
      _user.customer_exists = resData!.customer_exists;
      if (_user.customer_exists!) {
        _user.token = resData.token;
        _apiResponse = ApiResponse.complete("Complete");
        cacheUser(resData.token!);
      }
    }
    notifyListeners();
    return _user.customer_exists;
  }

  Future<bool> register(Map<String, dynamic> body) async {
    _apiResponse = ApiResponse.loading("Logging...");
    notifyListeners();
    final res = await ApiService.create().register(_user.attempt_id!, body);
    final resData = res.body;
    if (!res.isSuccessful) {
      _apiResponse = ApiResponse.error(res.error.toString());
      notifyListeners();
      return false;
    }
    _user.token = resData["token"];
    _apiResponse = ApiResponse.complete("complete");
    notifyListeners();
    cacheUser(resData["token"]);
    return true;
  }

  void cacheUser(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final userData = json.encode({
      "token": token,
      "expiryDate": DateTime.now().add(Duration(hours: 1)).toIso8601String(),
    });
    prefs.setString("userData", userData.toString());
  }

  Future<void> getCachedUser() async {
    // _user.token = "f0dcae24-7399-4ece-835b-10f767b7c641";
    // return;
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey("UserData")) return;
    final extractedData = json.decode(prefs.getString("userData").toString());
    final expiryDate = extractedData["expiryDate"];
    if (expiryDate.isBefore(DateTime.now())) return;
    _expiryDate = expiryDate;
    _user.token = extractedData["token"];
    _apiResponse = ApiResponse.complete("complete");
    notifyListeners();
    setExpirationTime();
  }

  Future<void> logout() async {
    _user = User();
    _expiryDate = null;
    if (_authTimer != null) {
      _authTimer!.cancel();
      _authTimer = null;
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Future<void> setExpirationTime() async {
    if (_authTimer != null) {
      _authTimer!.cancel();
    }
    _authTimer = Timer(
        Duration(
            seconds: DateTime.parse(_expiryDate!)
                .difference(DateTime.now())
                .inSeconds),
        logout);
  }
}

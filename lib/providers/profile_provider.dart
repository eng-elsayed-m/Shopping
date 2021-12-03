import 'package:flutter/foundation.dart';
import 'package:rzq_customer/api/api_service.dart';
import 'package:rzq_customer/model/user/user_data.dart';

class ProfileProvider extends ChangeNotifier {
  final String? token;
  ProfileProvider({@required this.token});
  UserData? _userData;
  UserData? get userData => _userData;

  Future editProfile() async {
    if (_userData != null) return;
    final res = await ApiService.create().editProfile(token!);
    if (!res.isSuccessful) {}
    final resData = res.body;
    _userData = resData;
    notifyListeners();
  }

  void updateProfile(Map<String, dynamic> body) async {
    ApiService.create().updateProfile(token!, body);
    _userData = null;
  }
}

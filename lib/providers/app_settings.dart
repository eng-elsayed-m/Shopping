import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppSettingsProvider extends ChangeNotifier {
  static AppSettingsProvider of(BuildContext context, {bool listen = true}) =>
      Provider.of<AppSettingsProvider>(context, listen: listen);

  String? _showProvidersCount;
  String? _complaintsEmail;
  String? _appstoreUrl;
  String? _gplayUrl;
  String? _fbUrl;
  String? _instagramUrl;
  String? _youtubeUrl;
  String? _twitterUrl;
  String? _linkedUrl;
  String? _snapchatUrl;
  String? _customerServicePhone;
  String? _showCustomerServicePhone;
  String? _aboutEn;
  String? _aboutAr;
  String? _privacyEn;
  String? _privacyAr;
  String? _termsEn;
  String? _termsAr;
  String? _taxid;
  String? _taxper;
  int? _daysToReserve;

  String getShowProvidersCount() => _showProvidersCount!;
  String getComplaintsEmail() => _complaintsEmail!;
  String getAppstoreUrl() => _appstoreUrl!;
  String getGplayUrl() => _gplayUrl!;
  String getFbUrl() => _fbUrl!;
  String getInstagramUrl() => _instagramUrl!;
  String getYoutubeUrl() => _youtubeUrl!;
  String getTwitterUrl() => _twitterUrl!;
  String getLinkedInUrl() => _linkedUrl!;
  String getSnapchatUrl() => _snapchatUrl!;
  String getCustomerServicePhone() => _customerServicePhone!;
  String getShowCustomerServicePhone() => _showCustomerServicePhone!;
  String getAboutEn() => _aboutEn!;
  String getAboutAr() => _aboutAr!;
  String getPrivacyEn() => _privacyEn!;
  String getPrivacyAr() => _privacyAr!;
  String getTermsEn() => _termsEn!;
  String getTermsAr() => _termsAr!;
  String getTaxid() => _taxid!;
  String getTaxper() => _taxper!;
  int getDaysToReserve() => _daysToReserve!;

  void setShowProvidersCount(String value) {
    _showProvidersCount = value;
    notifyListeners();
  }

  void setComplaintsEmail(String value) {
    _complaintsEmail = value;
    notifyListeners();
  }

  void setAppstoreUrl(String value) {
    _appstoreUrl = value;
    notifyListeners();
  }

  void setGplayUrl(String value) {
    _gplayUrl = value;
    notifyListeners();
  }

  void setFbUrl(String value) {
    _fbUrl = value;
    notifyListeners();
  }

  void setInstagramUrl(String value) {
    _instagramUrl = value;
    notifyListeners();
  }

  void setYoutubeUrl(String value) {
    _youtubeUrl = value;
    notifyListeners();
  }

  void setTwitterUrl(String value) {
    _twitterUrl = value;
    notifyListeners();
  }

  void setSnapchatUrl(String value) {
    _snapchatUrl = value;
    notifyListeners();
  }

  void setCustomerServicePhone(String value) {
    _customerServicePhone = value;
    notifyListeners();
  }

  void setShowCustomerServicePhone(String value) {
    _showCustomerServicePhone = value;
    notifyListeners();
  }

  void setAboutEn(String value) {
    _aboutEn = value;
    notifyListeners();
  }

  void setAboutAr(String value) {
    _aboutAr = value;
    notifyListeners();
  }

  void setPrivacyEn(String value) {
    _privacyEn = value;
    notifyListeners();
  }

  void setPrivacyAr(String value) {
    _privacyAr = value;
    notifyListeners();
  }

  void setTermsEn(String value) {
    _termsEn = value;
    notifyListeners();
  }

  void setTermsAr(String value) {
    _termsAr = value;
    notifyListeners();
  }

  void setTaxid(String value) {
    _taxid = value;
    notifyListeners();
  }

  void setTaxper(String value) {
    _taxper = value;
    notifyListeners();
  }

  void setLinkedInUrl(String value) {
    _linkedUrl = value;
    notifyListeners();
  }

  void setDaysToReserve(int value) {
    _daysToReserve = value;
    notifyListeners();
  }
}

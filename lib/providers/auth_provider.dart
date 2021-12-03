// import 'dart:convert';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_toolbox/flutter_toolbox.dart';
// import 'package:http/http.dart';
// import 'package:provider/provider.dart';
// import 'package:rzq_customer/model/user/user.dart';
//
// const KEY_LOGIN_STATUS = "KEY_LOGIN_STATUS";
// const STATE_LOGGED_IN = "STATE_LOGGED_IN";
// const STATE_UNDEFINED = "STATE_UNDEFINED";
//
// const KEY_USER_INFO = "KEY_USER_INFO";
//
// class AuthProvider extends ChangeNotifier {
//   static AuthProvider of(BuildContext context, {bool listen = true}) =>
//       Provider.of<AuthProvider>(context, listen: listen);
//
//   User _user;
//
//   User getUserCashed() => _user;
//
//   // Future<void> login(
//   //   BuildContext context,
//   //   String login,
//   //   String password,
//   //   Function onSuccess, {
//   //   bool Function(UserResponse user) checkProviderOrUser,
//   //   Function(ErrorResponse result) onError,
//   //   bool showServerErrorMessage = true,
//   // }) async {
//   //   await safeRequest<UserResponse>(
//   //     api().login(login, password),
//   //     onSuccess: (user) async {
//   //       if (!checkProviderOrUser(user)) {
//   //         (await prefs()).setString(KEY_LOGIN_STATUS, STATE_LOGGED_IN);
//   //         await saveUserInfo(user.success);
//   //         _sendFcmToken(context);
//   //
//   //         notifyListeners();
//   //         onSuccess();
//   //       }
//   //     },
//   //     onError: onError,
//   //     showServerErrorMessage: showServerErrorMessage,
//   //   );
//   // }
//
//   Future<void> register(
//     BuildContext context,
//     String name,
//     String fullname,
//     String email,
//     String password,
//     String c_password,
//     Function onSuccess, {
//     Function(ErrorResponse result) onError,
//     bool showServerErrorMessage = true,
//   }) async {
//     await safeRequest<UserResponse>(
//       api().register(name, fullname, email.replaceAll("+", ""), password, c_password),
//       onSuccess: (user) async {
//         (await prefs()).setString(KEY_LOGIN_STATUS, STATE_LOGGED_IN);
//
//         await saveUserInfo(user.success);
//         _sendFcmToken(context);
//
//         d('register#response=$user');
//         notifyListeners();
//         onSuccess();
//       },
//       onError: onError,
//       showServerErrorMessage: showServerErrorMessage,
//     );
//   }
//
//   Future<void> editProfile(
//     BuildContext context, {
//     String name,
//     String fullname,
//     String email,
//     String password,
//     String passwordConfirmation,
//     String currentPassword,
//     MultipartFile profilepic,
//     MultipartFile coverpic,
//     Function(User user) onSuccess,
//   }) async {
//     await safeRequest<User>(
//       api().editProfile(
//         name: name?.isEmpty == true ? null : name,
//         fullname: fullname?.isEmpty == true ? null : fullname,
//         email: email?.isEmpty == true ? null : email,
//         password: password?.isEmpty == true ? null : password,
//         passwordConfirmation: passwordConfirmation?.isEmpty == true ? null : passwordConfirmation,
//         currentPassword: currentPassword?.isEmpty == true ? null : currentPassword,
//         profilepic: profilepic,
//         coverpic: coverpic,
//       ),
//       onSuccess: (user) async {
//         await saveUser(user);
//
//         d('editProfile#response=$user');
//         notifyListeners();
//         onSuccess?.call(user);
//       },
//     );
//   }
//
//   Future<void> logout(Function onSuccess, BuildContext context) async {
//     safeRequest(api().setFcmToken("dummyToken"));
//
//     (await prefs()).setString(KEY_LOGIN_STATUS, STATE_UNDEFINED);
//     (await prefs()).setString("pin", "");
//     (await prefs()).setString("close", "");
//     (await prefs()).setStringList("RefuseOrderList", []);
//
//     await saveUserInfo(null);
//
//     onSuccess();
//
//     notifyListeners();
//   }
//
//   Future<bool> saveUserInfo(Success userInfo) async {
//     var isSuccessful = (await prefs()).setString(KEY_USER_INFO, jsonEncode(userInfo?.toJson()));
//
//     if (userInfo != null) handleFireBaseSignIn();
//
//     _user = userInfo?.user;
//
//     notifyListeners();
//     return isSuccessful;
//   }
//
//   Future<bool> saveUser(User user) async {
//     var isSuccessful =
//         (await prefs()).setString(KEY_USER_INFO, jsonEncode(((await getUserInfo())..user = user).toJson()));
//
//     _user = user;
//
//     notifyListeners();
//     return isSuccessful;
//   }
//
//   Future<Success> getUserInfo() async {
//     var userInfo;
//     try {
//       String userInfoJson = (await prefs()).getString(KEY_USER_INFO);
//       userInfo = Success.fromJson(jsonDecode(userInfoJson));
//
// //      d("userInfo = $_userInfo");
//     } catch (e) {
//       d("AuthProvider#getUserInfo Error -> $e");
//       return null;
//     }
//     return userInfo;
//   }
//
//   Future<User> getUser() async {
//     var userInfo = await getUserInfo();
//     User user = (userInfo)?.user;
//
// //    d("token = ${userInfo?.token}");
// //    d("user = $user");
//
//     return user;
//   }
//
//   bool isLoggedInCashed() => getUserCashed() != null;
//
//   Future<bool> isLoggedIn() async => await getUser() != null;
//
//   void handleFireBaseSignIn() async {
//     User user = await getUser();
//     String fcmToken = await FirebaseMessaging().getToken();
//
//     FirebaseFirestore.instance.collection('users').doc(user.id.toString()).set({
//       'name': '${user.name} ${user.fullname}',
//       'profilepic': "$baseUrl${user.profilepic}",
//       'id': user.id.toString(),
//       'tokens': FieldValue.arrayUnion([fcmToken])
//     }, SetOptions(merge: true));
//     toast("Sign in success");
//   }
//
//   _sendFcmToken(BuildContext context) async {
//     String fcmToken = await FirebaseMessaging().getToken();
//     d("fcmToken = $fcmToken");
//
//     safeRequest(api().setFcmToken(fcmToken));
//   }
// }
//
// Future<String> getToken() async {
//   String userInfoJson = (await prefs()).getString(KEY_USER_INFO);
//
//   if (userInfoJson == null || userInfoJson == 'null')
//     return null;
//   else
//     return "Bearer ${Success.fromJson(jsonDecode(userInfoJson)).token}";
// }

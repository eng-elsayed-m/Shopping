// import 'dart:convert';
// import 'dart:io';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_toolbox/flutter_toolbox.dart';
// import 'package:http/http.dart' as http;
// import 'package:rzq_customer/model/user/user.dart';
//
// import '../app.dart';
//
// final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
//
// const _key = "AIzaSyAJGrnFZvzHob-FC5a_XJ9Zwzr7kga9WDw";
//
// void initFcm(BuildContext context) {
//   _firebaseMessaging.configure(
//     onMessage: (Map<String, dynamic> message) async {
//       d("onMessage: $message");
//       if (Platform.isAndroid) {
//         await showLocalNotification(context, message);
//       } else {
//         final alert = message['aps']['alert'];
//         d(alert);
//         await showIosNotificationDialog(
//           context,
//           alert['body'].hashCode,
//           alert['title'].toString(),
//           alert['body'].toString(),
//           json.encode(message),
//         );
//       }
//     },
//     onLaunch: (Map<String, dynamic> message) async {
//       d("onLaunch: $message");
//       onNotificationClick(context, message);
//     },
//     onResume: (Map<String, dynamic> message) async {
//       d("onResume: $message");
//       onNotificationClick(context, message);
//     },
//   );
//   _firebaseMessaging.requestNotificationPermissions(
//       const IosNotificationSettings(sound: true, badge: true, alert: true));
//   _firebaseMessaging.onIosSettingsRegistered
//       .listen((IosNotificationSettings settings) {
//     d("Settings registered: $settings");
//   });
// }
//
// Future showLocalNotification(
//     BuildContext context, Map<String, dynamic> message) async {
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   final initializationSettingsAndroid =
//       AndroidInitializationSettings('ic_notification');
//
//   final initializationSettingsIOS = IOSInitializationSettings(
//       onDidReceiveLocalNotification:
//           (int id, String title, String body, String payload) =>
//               showIosNotificationDialog(context, id, title, body, payload));
//
//   final initializationSettings = InitializationSettings(
//       initializationSettingsAndroid, initializationSettingsIOS);
//
//   flutterLocalNotificationsPlugin.initialize(
//     initializationSettings,
//     onSelectNotification: (String payload) async {
//       final message = json.decode(payload) as Map<String, dynamic>;
//       onNotificationClick(context, message);
//     },
//   );
//
//   final androidPlatformChannelSpecifics = AndroidNotificationDetails(
//     appName,
//     appName,
//     appName,
//     importance: Importance.Max,
//     priority: Priority.High,
//   );
//   final iOSPlatformChannelSpecifics = IOSNotificationDetails();
//   final platformChannelSpecifics = NotificationDetails(
//       androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
//   await flutterLocalNotificationsPlugin.show(
//     message['notification']['body'].hashCode,
//     message['notification']['title'].toString(),
//     message['notification']['body'].toString(),
//     platformChannelSpecifics,
//     payload: json.encode(message),
//   );
// }
//
// void sendMessageNotification(String token, String message, User user) {
//   d('sendMessageNotification');
//   sendNotificationToToken(token, user.name, message, {
//     'message': message,
//     'user': user.toJson(),
//     'dataType': 'ChatMessage',
//   });
// }
//
// Future sendNotificationToToken(String token, String title, String body,
//     [Map additionalDate]) async {
//   final notificationBody = json.encode({
//     "to": "$token",
//     'notification': {
//       "title": title,
//       "body": body,
//     },
//     "data": {
//       ...additionalDate,
//       "click_action": "FLUTTER_NOTIFICATION_CLICK",
//     },
//     "priority": "high",
//   });
//
//   var url = 'https://fcm.googleapis.com/fcm/send';
//   var response = await http.post(
//     url,
//     body: notificationBody,
//     headers: {
//       'Authorization': 'key=$_key',
//       'Content-Type': 'application/json',
//     },
//   );
//
//   d('Response body: ${response.body}');
// }
//
// Future showIosNotificationDialog(BuildContext context, int id, String title,
//     String body, String payload) async {
//   d("showIosNotificationDialog");
//   await showDialog(
//     context: context,
//     builder: (BuildContext context) => CupertinoAlertDialog(
//       title: Text(title),
//       content: Text(body),
//       actions: [
//         CupertinoDialogAction(
//           isDefaultAction: true,
//           child: Text("ok"),
//           onPressed: () async {
//             Navigator.of(context, rootNavigator: true).pop();
//
//             final message = json.decode(payload) as Map<String, dynamic>;
//             onNotificationClick(context, message);
//           },
//         )
//       ],
//     ),
//   );
// }
//
// void onNotificationClick(BuildContext context, Map<String, dynamic> message) {
//   final data = message['data'] ?? message;
//   if (data['dataType'] == 'ChatMessage') {}
// }

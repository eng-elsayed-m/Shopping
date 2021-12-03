//import 'dart:async';
//import 'dart:isolate';
//import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // Set `enableInDevMode` to true to see reports while in debug mode
  // This is only to be used for confirming that reports are being
  // submitted as expected. It is not intended to be used for everyday
  // development.
//  Crashlytics.instance.enableInDevMode = true;

  // Pass all uncaught errors to Crashlytics.
  // FlutterError.onError = Crashlytics.instance.recordFlutterError;
  // runZonedGuarded(() {
  runApp(App());
  // }, Crashlytics.instance.recordError);
  // Isolate.current.addErrorListener(RawReceivePort((pair) async {
  //   final List<dynamic> errorAndStacktrace = pair;
  //   await Crashlytics.instance.recordError(
  //     errorAndStacktrace.first,
  //     errorAndStacktrace.last,
  //   );
  // }).sendPort);
}

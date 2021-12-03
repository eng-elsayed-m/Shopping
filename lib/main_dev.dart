import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:niddler_dart/niddler_dart.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white, // Color for Android
        statusBarBrightness:
            Brightness.dark // Dark == white status bar -- for IOS.
        ),
  );

  await Firebase.initializeApp();

  final niddlerBuilder = NiddlerBuilder()..bundleId = 'com.xoapp.customer';
  final niddler = niddlerBuilder.build();
  await niddler.start();

  niddler.install();

  runApp(App());
}

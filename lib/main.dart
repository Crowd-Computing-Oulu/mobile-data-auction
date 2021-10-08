

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lbp/model/hive/DailyQ.dart';
import 'package:lbp/screens/new_home_screen/NewHomeScreen.dart';
import 'package:lbp/screens/onBoarding.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(DailyQAdapter());
  await Hive.openBox<DailyQ>("testBox");

  await Firebase.initializeApp();
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  // FirebaseCrashlytics.instance.crash();

  Widget _defaultHome = new OnBoarding();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var firstTime = prefs.getBool("first_time");
  if (firstTime == false) {
    _defaultHome = NewHomeScreen();
  }
  // final appDocumentDir = await pathProvider.getApplicationDocumentsDirectory();
  // Hive.init(appDocumentDir.path);

  runApp(new MaterialApp(
    title: 'Sleep Better with Back Pain',
    theme: ThemeData(
      primaryColor: Color(0xff000000), //Color.fromRGBO(58, 66, 86, 1.0),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    debugShowCheckedModeBanner: false,
    home: _defaultHome,
    routes: <String, WidgetBuilder>{
      'home': (BuildContext context) => new NewHomeScreen(),
      'onboarding': (BuildContext context) => new OnBoarding(),
    },
  ));
}

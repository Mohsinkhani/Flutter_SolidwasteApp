import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solidwaste/screen/Introscreen/view/introScreen.dart';
import 'package:solidwaste/screen/LoginScreen/view/loginscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterNativeSplash.remove();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool("showHome") ?? false;
  runApp(MyApp(
    showHome: showHome,
  ));
}

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({Key? key, required this.showHome}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Solid Waste',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: showHome ? LoginScreen() : IntroScreen(),
    );
  }
}

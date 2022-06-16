import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_booking_app/controllers/controllers.dart';
import 'package:movie_booking_app/screens/screens.dart';
import 'package:movie_booking_app/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Booking App',
      theme: ThemeColor.myLightTheme,
      home: const SplashScreen(),
    );
  }
}

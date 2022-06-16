import 'package:flutter/material.dart';
import 'package:movie_booking_app/screens/screens.dart';
import 'package:movie_booking_app/utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Booking App',
      theme: ThemeColor.myLightTheme,
      home: const SplashScreen(),
    );
  }
}


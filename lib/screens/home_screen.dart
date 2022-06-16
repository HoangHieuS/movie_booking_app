import 'package:flutter/material.dart';
import 'package:movie_booking_app/controllers/controllers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            AuthController.instance.signOut();
          },
          child: const Center(
            child: Text('Logout'),
          ),
        ),
      ),
    );
  }
}

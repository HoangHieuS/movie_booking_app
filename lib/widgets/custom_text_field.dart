import 'package:flutter/material.dart';
import 'package:movie_booking_app/utils/utils.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final bool isFirst;
  final TextEditingController controller;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.isPassword = false,
    this.isFirst = false,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: isFirst ? 15 : 10),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword ? true : false,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black45),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
          fillColor: ThemeColor.greyColor,
          filled: true,
        ),
      ),
    );
  }
}

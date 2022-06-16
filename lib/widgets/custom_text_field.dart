import 'package:flutter/material.dart';
import 'package:movie_booking_app/utils/utils.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final bool isFirst;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.isPassword = false,
    this.isFirst = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: isFirst == true ? 15 : 10),
      child: TextFormField(
        obscureText: isPassword == true ? true : false,
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

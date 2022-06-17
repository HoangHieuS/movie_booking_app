import 'package:flutter/material.dart';
import 'package:movie_booking_app/utils/utils.dart';

class CustomSlider extends StatelessWidget {
  final currentIndex;

  const CustomSlider({Key? key, this.currentIndex = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.3,
      width: size.width,
      child: Image.asset(
        sliderData[currentIndex].url,
        fit: BoxFit.cover,
      ),
    );
  }
}

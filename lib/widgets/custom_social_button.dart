import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_booking_app/utils/utils.dart';

class CustomSocialButton extends StatelessWidget {
  final Function() onTap;
  final String name;
  final String imageUrl;
  final bool isGoogle;

  const CustomSocialButton({
    Key? key,
    required this.onTap,
    required this.name,
    required this.imageUrl,
    this.isGoogle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: isGoogle ? ThemeColor.redLight : ThemeColor.blueLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(
              color: isGoogle ? ThemeColor.redBorder : ThemeColor.blueBorder,
              width: 0.2),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            child: Row(
              children: [
                SvgPicture.asset(imageUrl),
                const SizedBox(width: 8),
                Text(
                  name,
                  style: const TextStyle(
                    color: Color(0xFF666666),
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

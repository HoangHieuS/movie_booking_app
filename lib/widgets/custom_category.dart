import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/utils.dart';

class CustomCategory extends StatelessWidget {
  final bool isList;
  final bool isMovie;
  final String? svgUrl;
  final String categoryName;

  const CustomCategory({
    Key? key,
    this.isList = false,
    this.isMovie = false,
    this.svgUrl,
    required this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isList
          ? const EdgeInsets.only(top: 20, left: 20, right: 20)
          : const EdgeInsets.only(top: 10, left: 20),
      child: isList
          ? Row(
              children: [
                isMovie
                    ? SvgPicture.asset(
                        svgUrl!,
                        color: Colors.black.withOpacity(0.8),
                        height: 18,
                        width: 18,
                      )
                    : const SizedBox.shrink(),
                isMovie ? const SizedBox(width: 5) : const SizedBox.shrink(),
                Text(
                  categoryName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.8),
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ThemeColor.splash,
                    ),
                  ),
                ),
              ],
            )
          : Text(
              categoryName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.8),
              ),
            ),
    );
  }
}

import 'package:flutter/material.dart';

import '../controllers/controllers.dart';
import '../utils/utils.dart';

class MovieReview extends StatelessWidget {
  const MovieReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? imgUrl = AuthController.instance.user!.photoURL;
    imgUrl = imgUrl ?? Constants.dummyAvatar;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '1043 reviews',
                style: TextStyle(fontSize: 14),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Write yours >',
                  style: TextStyle(color: ThemeColor.splash),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: CircleAvatar(foregroundImage: NetworkImage(imgUrl)),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        AuthController.instance.user!.displayName ?? 'Unknown',
                    style: const TextStyle(color: Colors.black87),
                  ),
                  const WidgetSpan(
                    child: SizedBox(width: 10),
                  ),
                  const TextSpan(
                    text: '28 Jun 2022',
                    style: TextStyle(color: Colors.black45),
                  ),
                ],
              ),
            ),
            subtitle: const Text(
                "With all the updates after the last few months the app has improved a lot. Keeps me up to date."),
          ),
        ],
      ),
    );
  }
}

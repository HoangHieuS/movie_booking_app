import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_booking_app/utils/utils.dart';
import 'package:movie_booking_app/widgets/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: ThemeColor.splash,
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: _size.width,
        height: _size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/splash_icon.svg'),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: const EdgeInsets.all(19),
              width: _size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Create your account',
                    style: TextStyle(
                      fontSize: 16,
                      color: ThemeColor.splash,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const CustomTextField(
                    hintText: 'Name',
                    isFirst: true,
                  ),
                  const CustomTextField(hintText: 'Email Address'),
                  const CustomTextField(
                    hintText: 'Password',
                    isPassword: true,
                  ),
                  const CustomTextField(
                    hintText: 'Confirm Password',
                    isPassword: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: ThemeColor.splash,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            'Or',
                            style: TextStyle(
                              color: Color(0xFFC1C1C1),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomSocialButton(
                          imageUrl: 'assets/icons/google.svg',
                          name: 'Google',
                          onTap: () {},
                          isGoogle: true,
                        ),
                        const SizedBox(width: 10),
                        CustomSocialButton(
                          imageUrl: 'assets/icons/facebook.svg',
                          name: 'Facebook',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Already have an account ? ',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(
                      text: 'Login',
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w700,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pop(context);
                        }),
                  const TextSpan(text: ' here.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

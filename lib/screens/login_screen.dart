import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:movie_booking_app/controllers/controllers.dart';
import 'package:movie_booking_app/screens/screens.dart';
import 'package:movie_booking_app/utils/utils.dart';
import 'package:movie_booking_app/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final forgotEmailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: ThemeColor.splash,
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/splash_icon.svg'),
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                'Welcome Buddies,',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              'Login to book your seat, I said its your seat',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: const EdgeInsets.all(19),
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Login to your account',
                    style: TextStyle(
                      fontSize: 16,
                      color: ThemeColor.splash,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CustomTextField(
                    controller: emailController,
                    hintText: 'Username',
                    isFirst: true,
                  ),
                  CustomTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    isPassword: true,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Get.defaultDialog(
                          title: 'Forgot Password?',
                          content: CustomTextField(
                            hintText: 'Email address',
                            controller: forgotEmailController,
                          ),
                          radius: 10,
                          onWillPop: () {
                            forgotEmailController.text = '';
                            return Future.value(true);
                          },
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          confirm: ElevatedButton(
                            onPressed: () {
                              AuthController.instance.forgotPassword(
                                  forgotEmailController.text.trim());
                              forgotEmailController.text = '';
                              Get.back();
                            },
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
                                  'Send Reset Mail',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      AuthController.instance.login(emailController.text.trim(),
                          passwordController.text.trim());
                    },
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
                          'LOGIN',
                          style: TextStyle(fontSize: 16),
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
                          onTap: () {
                            AuthController.instance.googleLogin();
                          },
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
                    text: 'Don\'t have an account ? ',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(
                      text: 'Sign up',
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w700,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(const SignUpScreen());
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

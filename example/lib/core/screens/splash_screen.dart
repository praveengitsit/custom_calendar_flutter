import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF2C363F),
      body: Center(
          child: AnimatedContainer(
        duration: const Duration(
          seconds: 10,
        ),
        width: 200,
        height: 200,
        decoration: const BoxDecoration(
          color: Color(0XFFE75A7C),
          shape: BoxShape.circle,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.keyboard_arrow_left_outlined,
              size: 50.0,
              color: Color(0XFFBBC7A4),
            ),
            Icon(
              Icons.edit_calendar,
              size: 50.0,
              color: Colors.white,
            ),
            Icon(
              Icons.keyboard_arrow_right_outlined,
              size: 50.0,
              color: Color(0XFFBBC7A4),
            ),
          ],
        ),
      )),
    );
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRoutes.homeRoute(), (route) => false);
    });
  }
}

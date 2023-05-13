import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vc_app/Pages/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      // Get.to(const HomePage());

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            "assets/images/splash.png",
            // fit: BoxFit.cover,
            height: 150,
            width: 250,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        const CircularProgressIndicator(color: Colors.lightBlue)
      ],
    ));
  }
}

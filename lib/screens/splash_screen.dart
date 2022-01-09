import 'dart:async';

import 'package:flutter/material.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/furniture_logo.png',
              height: 120,
              width: 120,
            ),
            const SizedBox(
              height: 32,
            ),
            const Text(
              'HDSL',
              style: TextStyle(fontSize: 30, fontFamily: 'lobster'),
            ),
            const Text(
              'Furniture',
              style: TextStyle(fontSize: 30, fontFamily: 'pacifico'),
            ),
          ],
        ),
      ),
    );
  }
}

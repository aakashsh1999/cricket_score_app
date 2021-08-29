import 'dart:async';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer _timer;

  @override
  void initState() {
    _timer = Timer(Duration(seconds: 2), () {
      Get.offAllNamed('/home');
    });

    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/splashIcon.png',
          width: 200.0,
          height: 200.0,
        ),
      ),
    );
  }
}

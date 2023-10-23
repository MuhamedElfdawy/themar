import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:themar/view/auth/login/view.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}
class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: -52,
            left: 85,
            child: Image.asset('asset/image/png/vegetables.png',
              height: 298,
              width: 448,
              fit: BoxFit.fill,
            ),
          ),
          Image.asset(
            'asset/image/png/splash.png',
            height: 125,
            width: 130,
            fit: BoxFit.fill,
          ),
          Center(
            child: FadeInDown(
              child: Image.asset(
                'asset/image/png/logo.png',
                height: 157.08,
                width: 159.57,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
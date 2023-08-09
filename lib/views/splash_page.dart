import 'dart:async';

import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.popAndPushNamed(context, '/loginPage');
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset('header-splash.png'),
          ),
          Center(
            child: Image.asset('logo.png'),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset('footer-splash.png'),
          )
        ],
      ),
    );
  }
}
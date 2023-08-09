import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

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
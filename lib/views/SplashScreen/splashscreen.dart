// Example of SplashScreen
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:orange_theatre/views/Dashboard%20Animation/AnimationHomePage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const AnimationHomePage()),
        (route) => false,
      ),
    );

    return const Scaffold(
      body: Center(child: Text('Splash Screen')),
    );
  }
}

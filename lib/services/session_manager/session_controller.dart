import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:orange_theatre/views/OnBoardingScreen/onboarding_page.dart';
import 'package:orange_theatre/views/SplashScreen/splashscreen.dart';
import '../splash/splash_services.dart'; // Update with the actual path

class SplashServices {
  void checkUserStatus(BuildContext context) {
    SessionController().isOnboardingCompleted().then((onboardingCompleted) {
      if (kDebugMode) {
        print('i am in SPLASH SERVICE');
      }

      Timer(
        const Duration(seconds: 1),
        () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => onboardingCompleted
                ? const SplashScreen() // For returning users, show splash screen
                : const OnBoardingPage(), // For new users, show onboarding
          ),
          (route) => false,
        ),
      );
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('i am ERROR in SPLASH SERVICE');
      }

      Timer(
        const Duration(seconds: 1),
        () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const OnBoardingPage()),
          (route) => false,
        ),
      );
    });
  }
}

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../session_manager/session_controller.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    SessionController().getUserFromPreference().then((value) {
      if (kDebugMode) {
        print('i am in SPLASH SERVICE');
      }
      if (SessionController().isLogin ?? false) {
        // print('i am in SPLASH SERVICE');
        // Timer(
        //   const Duration(seconds: 1),
        //   () => Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(builder: (context) => const RootApp()),
        //     (route) => false,
        //   ),
        // );
      } else {
        // Timer(
        //   const Duration(seconds: 3),
        //   () => Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(builder: (context) => const LoginScreen()),
        //     (route) => false,
        //   ),
        // );
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('i am ERROR in SPLASH SERVICE');
      }

      // Timer(
      //   const Duration(seconds: 3),
      //   () => Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(builder: (context) => const LoginScreen()),
      //     (route) => false,
      //   ),
      // );
    });
  }
}

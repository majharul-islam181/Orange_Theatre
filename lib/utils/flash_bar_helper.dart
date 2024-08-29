import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

class FlashBarHelper {
static  void flushBarErrorMessage( String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(15),
          message: message,
          duration: const Duration(seconds: 3),
          borderRadius: BorderRadius.circular(8),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Colors.red,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: const Icon(
            Icons.error,
            size: 28,
            color: Colors.white,
          ),
        )..show(context));
  }


  static void flushBarSuccessMessage( String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(15),
          message: message,
          duration: const Duration(seconds: 2),
          borderRadius: BorderRadius.circular(8),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Colors.green,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: const Icon(
            Icons.error,
            size: 28,
            color: Colors.white,
          ),
        )..show(context));
  }


}

// extension FlushBarErrorMessage on BuildContext {
//   void flushBarErrorMessage({required String message}) {
//     showFlushbar(
//         context: this,
//         flushbar: Flushbar(
//           forwardAnimationCurve: Curves.decelerate,
//           margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           padding: const EdgeInsets.all(15),
//           message: message,
//           duration: const Duration(seconds: 3),
//           borderRadius: BorderRadius.circular(8),
//           flushbarPosition: FlushbarPosition.TOP,
//           backgroundColor: Colors.red,
//           reverseAnimationCurve: Curves.easeInOut,
//           positionOffset: 20,
//           icon: const Icon(
//             Icons.error,
//             size: 28,
//             color: Colors.white,
//           ),
//         )..show(this));
//   }
// }

// extension FlushBarSuccessMessage on BuildContext {
//   void flushBarSuccessMessage({required String message}) {
//     showFlushbar(
//         context: this,
//         flushbar: Flushbar(
//           forwardAnimationCurve: Curves.decelerate,
//           margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           padding: const EdgeInsets.all(15),
//           message: message,
//           duration: const Duration(seconds: 3),
//           borderRadius: BorderRadius.circular(8),
//           flushbarPosition: FlushbarPosition.TOP,
//           backgroundColor: Colors.green,
//           reverseAnimationCurve: Curves.easeInOut,
//           positionOffset: 20,
//           icon: const Icon(
//             Icons.error,
//             size: 28,
//             color: Colors.white,
//           ),
//         )..show(this));
//   }
// }

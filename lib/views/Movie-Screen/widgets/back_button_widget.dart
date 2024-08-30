import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.07,
      left: 16,
      child: ClipOval(
        child: Material(
          color: Colors.white.withOpacity(0.2),
          child: InkWell(
            splashColor: Colors.grey,
            child: const SizedBox(
              width: 30,
              height: 30,
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
